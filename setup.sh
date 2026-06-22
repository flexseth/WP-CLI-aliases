#!/usr/bin/env bash
# =============================================================================
# WP-CLI Aliases — Interactive Setup Wizard
# =============================================================================
# Guides you through selecting which alias categories to install.
#
# USAGE:
#   ./setup.sh
#   ./install.sh --interactive
# =============================================================================

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly ALIASES_DIR="${SCRIPT_DIR}/aliases"
readonly POPULAR_FILE="${SCRIPT_DIR}/popular.sh"
readonly MARKER_PREFIX="# WP-CLI-aliases:"

# ── Colours ───────────────────────────────────────────────────────────────────
if [[ -t 1 ]]; then
    RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
    CYAN='\033[0;36m'; BOLD='\033[1m'; DIM='\033[2m'; RESET='\033[0m'
else
    RED=''; GREEN=''; YELLOW=''; CYAN=''; BOLD=''; DIM=''; RESET=''
fi

# ── Helpers ───────────────────────────────────────────────────────────────────
info()    { echo -e "${CYAN}›${RESET} $*"; }
success() { echo -e "${GREEN}✔${RESET} $*"; }
prompt()  { echo -e "${YELLOW}?${RESET} $*"; }

# ── Detect shell config ───────────────────────────────────────────────────────
detect_shell_config() {
    local shell_name
    shell_name="$(basename "${SHELL:-/bin/bash}")"
    case "$shell_name" in
        zsh)  echo "${ZDOTDIR:-$HOME}/.zshrc" ;;
        bash)
            if [[ -f "$HOME/.bash_profile" ]]; then echo "$HOME/.bash_profile"
            else echo "$HOME/.bashrc"; fi
            ;;
        *)    echo "$HOME/.profile" ;;
    esac
}

# ── Category metadata ─────────────────────────────────────────────────────────
declare -A CATEGORY_DESC=(
    [cache]="Object cache & transients flush"
    [comment]="Create, moderate, and delete comments"
    [config]="Manage wp-config.php constants and salts"
    [core]="Download, install, and update WordPress core"
    [cron]="List, run, and manage WP-Cron events"
    [db]="Import, export, query, and maintain the database"
    [eval]="Execute PHP inline or from a file"
    [import-export]="Import/export content via WXR files"
    [media]="Import media and regenerate thumbnails"
    [option]="Get, update, and delete WordPress options"
    [package]="Install and manage WP-CLI community packages"
    [plugin]="Install, activate, update, and delete plugins"
    [post]="Create, list, update, and delete posts"
    [rewrite]="Flush and manage rewrite rules"
    [role]="Manage roles and capabilities"
    [scaffold]="Generate plugin/theme/CPT boilerplate"
    [search-replace]="Search and replace strings in the database"
    [term]="Create and manage taxonomy terms"
    [theme]="Install, activate, update, and delete themes"
    [user]="Create, list, update, and delete users"
)

# ── Install helper ────────────────────────────────────────────────────────────
install_file() {
    local label="$1"
    local source_file="$2"
    local config_file="$3"
    local marker="${MARKER_PREFIX} ${label}"

    if grep -qF "$marker" "$config_file" 2>/dev/null; then
        info "'${label}' already installed — skipping."
        return 0
    fi

    {
        echo ""
        echo "${marker}"
        echo "source \"${source_file}\""
    } >> "$config_file"

    success "Installed '${label}'"
}

# ── Banner ────────────────────────────────────────────────────────────────────
print_banner() {
    echo ""
    echo -e "${BOLD}╔══════════════════════════════════════════════╗${RESET}"
    echo -e "${BOLD}║      WP-CLI Aliases — Setup Wizard           ║${RESET}"
    echo -e "${BOLD}╚══════════════════════════════════════════════╝${RESET}"
    echo ""
    echo -e "  This wizard installs shortcut aliases for WP-CLI commands"
    echo -e "  into your shell configuration file."
    echo ""
}

# ── Main wizard ───────────────────────────────────────────────────────────────
main() {
    print_banner

    # ── Step 1: Determine shell config file ──────────────────────────────────
    local default_config
    default_config="$(detect_shell_config)"

    echo -e "${BOLD}Step 1 of 3 — Shell configuration file${RESET}"
    echo ""
    prompt "Shell config file detected: ${YELLOW}${default_config}${RESET}"
    echo -n "  Press Enter to accept, or type a different path: "
    read -r custom_config
    local config_file="${custom_config:-$default_config}"

    # Create file if it doesn't exist
    if [[ ! -f "$config_file" ]]; then
        touch "$config_file"
        info "Created ${config_file}"
    fi

    echo ""
    echo -e "  Using: ${GREEN}${config_file}${RESET}"
    echo ""

    # ── Step 2: Choose install mode ──────────────────────────────────────────
    echo -e "${BOLD}Step 2 of 3 — Choose an install mode${RESET}"
    echo ""
    echo "  1)  Popular  — Install a curated set of the most-used aliases (recommended)"
    echo "  2)  All      — Install every alias category"
    echo "  3)  Pick     — Choose individual categories interactively"
    echo ""
    echo -n "  Enter your choice [1/2/3] (default: 1): "
    read -r install_mode
    install_mode="${install_mode:-1}"

    echo ""

    case "$install_mode" in
        1)
            # Popular
            echo -e "${BOLD}Step 3 of 3 — Installing popular aliases${RESET}"
            echo ""
            install_file "popular" "$POPULAR_FILE" "$config_file"
            ;;
        2)
            # All
            echo -e "${BOLD}Step 3 of 3 — Installing all alias categories${RESET}"
            echo ""
            for f in "${ALIASES_DIR}"/*.sh; do
                [[ -f "$f" ]] || continue
                local cat
                cat="$(basename "$f" .sh)"
                install_file "$cat" "$f" "$config_file"
            done
            ;;
        3)
            # Pick
            echo -e "${BOLD}Step 3 of 3 — Select categories${RESET}"
            echo ""
            echo -e "  ${DIM}Answer y/n for each category. Press Enter to skip (default: y).${RESET}"
            echo ""

            # Sort categories alphabetically
            local -a sorted_cats=()
            while IFS= read -r cat; do
                sorted_cats+=("$cat")
            done < <(printf '%s\n' "${!CATEGORY_DESC[@]}" | sort)

            local -a selected=()
            for cat in "${sorted_cats[@]}"; do
                local desc="${CATEGORY_DESC[$cat]:-}"
                echo -n "  Install ${BOLD}${cat}${RESET} (${DIM}${desc}${RESET}) ? [Y/n] "
                read -r ans
                ans="${ans:-y}"
                if [[ "$ans" =~ ^[Yy] ]]; then
                    selected+=("$cat")
                fi
            done

            echo ""
            if [[ ${#selected[@]} -eq 0 ]]; then
                echo -e "${YELLOW}No categories selected — nothing installed.${RESET}"
                exit 0
            fi

            echo -e "${BOLD}Installing selected categories …${RESET}"
            echo ""
            for cat in "${selected[@]}"; do
                local alias_file="${ALIASES_DIR}/${cat}.sh"
                if [[ -f "$alias_file" ]]; then
                    install_file "$cat" "$alias_file" "$config_file"
                else
                    echo -e "${RED}  ✗ Alias file not found for '${cat}'${RESET}"
                fi
            done
            ;;
        *)
            echo -e "${RED}Invalid choice '${install_mode}' — aborting.${RESET}"
            exit 1
            ;;
    esac

    # ── Step 3: Export WP_CLI_ALIASES_DIR ────────────────────────────────────
    local dir_marker="${MARKER_PREFIX} env"
    if ! grep -qF "$dir_marker" "$config_file" 2>/dev/null; then
        {
            echo ""
            echo "${dir_marker}"
            echo "export WP_CLI_ALIASES_DIR=\"${SCRIPT_DIR}\""
            if [[ ":${PATH}:" != *":${HOME}/.local/bin:"* ]]; then
                echo "export PATH=\"\$PATH:\$HOME/.local/bin\""
            fi
        } >> "$config_file"
        info "Set WP_CLI_ALIASES_DIR=${SCRIPT_DIR}"
    fi

    # ── Install wp-aliases bin ────────────────────────────────────────────────
    local local_bin="${HOME}/.local/bin"
    if [[ -d "$local_bin" ]]; then
        local dest="${local_bin}/wp-aliases"
        if [[ ! -f "$dest" ]]; then
            cp "${SCRIPT_DIR}/bin/wp-aliases" "$dest"
            chmod +x "$dest"
            success "Installed 'wp-aliases' command to ${dest}"
        fi
    fi

    # ── Done ──────────────────────────────────────────────────────────────────
    echo ""
    echo -e "${GREEN}${BOLD}All done!${RESET}"
    echo ""
    echo -e "  Reload your shell to activate the aliases:"
    echo -e "    ${YELLOW}source ${config_file}${RESET}"
    echo ""
    echo -e "  Then run ${BOLD}wp-aliases --help${RESET} to see your installed aliases."
    echo ""
}

main "$@"
