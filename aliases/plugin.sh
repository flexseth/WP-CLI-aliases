#!/usr/bin/env bash
# WP-CLI Plugin Aliases
# =====================
# Prefix: wpp  (wp plugin ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wppi      →  wp plugin install
#   wppia     →  wp plugin install --activate
#   wppa      →  wp plugin activate
#   wppaa     →  wp plugin activate --all
#   wppd      →  wp plugin deactivate
#   wppda     →  wp plugin deactivate --all
#   wppl      →  wp plugin list
#   wppu      →  wp plugin update
#   wppua     →  wp plugin update --all
#   wppr      →  wp plugin delete
#   wpps      →  wp plugin status
#   wpppath   →  wp plugin get --field=path
#   wppver    →  wp plugin get --field=version

# --- Install ---
alias wppi='wp plugin install'              # Install a plugin (by slug, zip, or URL)
alias wppia='wp plugin install --activate'  # Install and immediately activate a plugin

# --- Activate / Deactivate ---
alias wppa='wp plugin activate'             # Activate one or more plugins
alias wppaa='wp plugin activate --all'      # Activate all installed plugins
alias wppd='wp plugin deactivate'           # Deactivate one or more plugins
alias wppda='wp plugin deactivate --all'    # Deactivate all active plugins

# --- List & Status ---
alias wppl='wp plugin list'                 # List all installed plugins
alias wpps='wp plugin status'               # Show status of one or all plugins
alias wppla='wp plugin list --status=active'           # List only active plugins
alias wppli='wp plugin list --status=inactive'         # List only inactive plugins
alias wpplf='wp plugin list --format=table'            # List plugins as a table

# --- Update ---
alias wppu='wp plugin update'               # Update a specific plugin
alias wppua='wp plugin update --all'        # Update all plugins
alias wppucl='wp plugin update --dry-run'   # Check for plugin updates without applying

# --- Delete ---
alias wppr='wp plugin delete'               # Remove (delete) a plugin

# --- Info ---
alias wppver='wp plugin get --field=version'  # Get installed version of a plugin
alias wpppath='wp plugin get --field=path'    # Get filesystem path of a plugin
