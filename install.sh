#!/usr/bin/env bash
# =============================================================================
# WP-CLI Aliases — Master Installation Script
# =============================================================================
# Adds WP-CLI shortcut aliases to your shell configuration file.
#
# USAGE:
#   ./install.sh [OPTIONS]
#
# OPTIONS:
#   --all               Install all alias categories
#   --popular           Install the curated popular-commands set only
#   --category NAME     Install a specific category (e.g. plugin, theme, db)
#   --interactive       Run interactive category-selection wizard
#   --list              List all available alias categories
#   --uninstall         Remove all WP-CLI aliases from your shell config
#   --shell-config FILE Override the target shell config file
#   --help, -h          Show this help message
#
# EXAMPLES:
#   ./install.sh --popular
#   ./install.sh --all
#   ./install.sh --category plugin
#   ./install.sh --category plugin --category theme
#   ./install.sh --interactive
#   ./install.sh --uninstall
# =============================================================================

set -euo pipefail

# ── Constants ─────────────────────────────────────────────────────────────────
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly ALIASES_DIR="${SCRIPT_DIR}/aliases"
readonly POPULAR_FILE="${SCRIPT_DIR}/popular.sh"
readonly BIN_FILE="${SCRIPT_DIR}/bin/wp-aliases"
readonly MARKER_PREFIX="# WP-CLI-aliases:"

# ── Colours ───────────────────────────────────────────────────────────────────
if [[ -t 1 ]]; then
    RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
    BLUE='\033[0;34m'; BOLD='\033[1m'; RESET='\033[0m'
else
    RED=''; GREEN=''; YELLOW=''; BLUE=''; BOLD=''; RESET=''
fi

# ── Helpers ───────────────────────────────────────────────────────────────────
info()    { echo -e "${BLUE}[info]${RESET}  $*"; }
success() { echo -e "${GREEN}[ok]${RESET}    $*"; }
warn()    { echo -e "${YELLOW}[warn]${RESET}  $*"; }
error()   { echo -e "${RED}[error]${RESET} $*" >&2; }
die()     { error "$*"; exit 1; }

# ── Detect shell config file ──────────────────────────────────────────────────
detect_shell_config() {
    local shell_name
    shell_name="$(basename "${SHELL:-/bin/bash}")"

    case "$shell_name" in
        zsh)
            echo "${ZDOTDIR:-$HOME}/.zshrc"
            ;;
        bash)
            if [[ -f "$HOME/.bash_profile" ]]; then
                echo "$HOME/.bash_profile"
            else
                echo "$HOME/.bashrc"
            fi
            ;;
        *)
            echo "$HOME/.profile"
            ;;
    esac
}

# ── List available categories ─────────────────────────────────────────────────
list_categories() {
    local -a cats=()
    for f in "${ALIASES_DIR}"/*.sh; do
        [[ -f "$f" ]] && cats+=("$(basename "$f" .sh)")
    done
    printf '%s\n' "${cats[@]}" | sort
}

# ── Check if already installed ────────────────────────────────────────────────
is_installed() {
    local marker="$1"
    local config_file="$2"
    grep -qF "$marker" "$config_file" 2>/dev/null
}

# ── Install a single alias file ───────────────────────────────────────────────
install_file() {
    local label="$1"      # human-readable label (e.g. "plugin", "popular")
    local source_file="$2"
    local config_file="$3"
    local marker="${MARKER_PREFIX} ${label}"

    if [[ ! -f "$source_file" ]]; then
        warn "Alias file not found: $source_file"
        return 1
    fi

    if is_installed "$marker" "$config_file"; then
        warn "'${label}' aliases already present in ${config_file} — skipping."
        return 0
    fi

    {
        echo ""
        echo "${marker}"
        echo "source \"${source_file}\""
    } >> "$config_file"

    success "Installed '${label}' aliases  →  ${config_file}"
}

# ── Install category by name ──────────────────────────────────────────────────
install_category() {
    local category="$1"
    local config_file="$2"
    local alias_file="${ALIASES_DIR}/${category}.sh"

    if [[ ! -f "$alias_file" ]]; then
        die "Unknown category '${category}'. Run './install.sh --list' to see available categories."
    fi

    install_file "$category" "$alias_file" "$config_file"
}

# ── Install ALL categories ────────────────────────────────────────────────────
install_all() {
    local config_file="$1"
    info "Installing all WP-CLI alias categories into ${config_file} …"
    while IFS= read -r cat; do
        install_category "$cat" "$config_file"
    done < <(list_categories)
}

# ── Install popular set ───────────────────────────────────────────────────────
install_popular() {
    local config_file="$1"
    info "Installing popular WP-CLI aliases into ${config_file} …"
    install_file "popular" "$POPULAR_FILE" "$config_file"
}

# ── Uninstall ────────────────────────────────────────────────────────────────
uninstall() {
    local config_file="$1"

    if [[ ! -f "$config_file" ]]; then
        warn "Config file not found: ${config_file}"
        return 0
    fi

    if ! grep -qF "$MARKER_PREFIX" "$config_file" 2>/dev/null; then
        info "No WP-CLI aliases found in ${config_file}."
        return 0
    fi

    # Remove marker lines and their corresponding source lines
    local tmp_file
    tmp_file="$(mktemp)"

    awk -v marker="$MARKER_PREFIX" '
        /^[[:space:]]*$/ { blank=$0; next }
        $0 ~ marker { skip=1; blank=""; next }
        skip && /^source / { skip=0; next }
        { if (blank != "") { print blank; blank="" } print; skip=0 }
    ' "$config_file" > "$tmp_file"

    cp "$tmp_file" "$config_file"
    rm -f "$tmp_file"

    success "Removed all WP-CLI aliases from ${config_file}"
}

# ── Install wp-aliases bin ────────────────────────────────────────────────────
install_bin() {
    local local_bin="${HOME}/.local/bin"
    if [[ -d "$local_bin" ]]; then
        local dest="${local_bin}/wp-aliases"
        if [[ ! -f "$dest" ]]; then
            cp "$BIN_FILE" "$dest"
            chmod +x "$dest"
            info "Installed 'wp-aliases' command to ${dest}"
        fi
    fi
}

# ── Show help ────────────────────────────────────────────────────────────────
show_help() {
    cat <<EOF
${BOLD}WP-CLI Aliases — Install Script${RESET}

${BOLD}USAGE${RESET}
    ./install.sh [OPTIONS]

${BOLD}OPTIONS${RESET}
    --all                  Install all alias categories
    --popular              Install the curated popular-commands set only
    --category NAME        Install a specific category
                           (may be repeated for multiple categories)
    --interactive          Run the interactive category-selection wizard
    --list                 List all available alias categories
    --uninstall            Remove all WP-CLI aliases from your shell config
    --shell-config FILE    Override the shell config target file
    --help, -h             Show this help message

${BOLD}AVAILABLE CATEGORIES${RESET}
$(list_categories | sed 's/^/    /')

${BOLD}EXAMPLES${RESET}
    # Install the popular set (recommended for first-time users)
    ./install.sh --popular

    # Install everything
    ./install.sh --all

    # Install specific categories
    ./install.sh --category plugin --category theme --category db

    # Interactive wizard
    ./install.sh --interactive

    # Uninstall
    ./install.sh --uninstall

${BOLD}AFTER INSTALLING${RESET}
    Reload your shell to activate the aliases:
        source ~/.bashrc        # bash
        source ~/.zshrc         # zsh

    Or open a new terminal window.

    Once loaded, run ${BOLD}wp-aliases --help${RESET} for a command reference.

EOF
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
    local mode=""
    local -a categories=()
    local config_override=""

    if [[ $# -eq 0 ]]; then
        show_help
        exit 0
    fi

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --all)
                mode="all"
                ;;
            --popular)
                mode="popular"
                ;;
            --category)
                [[ -z "${2:-}" ]] && die "--category requires a NAME argument"
                mode="category"
                categories+=("$2")
                shift
                ;;
            --interactive|--setup)
                mode="interactive"
                ;;
            --list)
                echo -e "${BOLD}Available alias categories:${RESET}"
                list_categories | sed 's/^/  • /'
                exit 0
                ;;
            --uninstall)
                mode="uninstall"
                ;;
            --shell-config)
                [[ -z "${2:-}" ]] && die "--shell-config requires a FILE argument"
                config_override="$2"
                shift
                ;;
            --help|-h)
                show_help
                exit 0
                ;;
            *)
                die "Unknown option: '$1'  (run './install.sh --help' for usage)"
                ;;
        esac
        shift
    done

    local config_file
    if [[ -n "$config_override" ]]; then
        config_file="$config_override"
    else
        config_file="$(detect_shell_config)"
    fi

    case "$mode" in
        all)
            install_all "$config_file"
            install_bin
            ;;
        popular)
            install_popular "$config_file"
            install_bin
            ;;
        category)
            for cat in "${categories[@]}"; do
                install_category "$cat" "$config_file"
            done
            install_bin
            ;;
        interactive)
            exec bash "${SCRIPT_DIR}/setup.sh"
            ;;
        uninstall)
            uninstall "$config_file"
            ;;
    esac

    if [[ "$mode" != "uninstall" && "$mode" != "interactive" ]]; then
        echo ""
        echo -e "${BOLD}All done!${RESET} Reload your shell to activate the aliases:"
        echo -e "  ${YELLOW}source ${config_file}${RESET}"
        echo ""
        echo -e "  Or run: ${YELLOW}wp-aliases --help${RESET}  for a command reference."
    fi
}

main "$@"
