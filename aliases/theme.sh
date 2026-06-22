#!/usr/bin/env bash
# WP-CLI Theme Aliases
# ====================
# Prefix: wpt  (wp theme ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpti      →  wp theme install
#   wptia     →  wp theme install --activate
#   wpta      →  wp theme activate
#   wptl      →  wp theme list
#   wptu      →  wp theme update
#   wptua     →  wp theme update --all
#   wptr      →  wp theme delete
#   wpts      →  wp theme status
#   wptver    →  wp theme get --field=version
#   wptpath   →  wp theme get --field=stylesheet_dir

# --- Install ---
alias wpti='wp theme install'               # Install a theme (by slug, zip, or URL)
alias wptia='wp theme install --activate'   # Install and immediately activate a theme

# --- Activate ---
alias wpta='wp theme activate'              # Activate a theme

# --- List & Status ---
alias wptl='wp theme list'                  # List all installed themes
alias wpts='wp theme status'                # Show status of one or all themes
alias wptla='wp theme list --status=active'       # Show the currently active theme
alias wptli='wp theme list --status=inactive'     # List inactive themes
alias wptlf='wp theme list --format=table'        # List themes as a table

# --- Update ---
alias wptu='wp theme update'                # Update a specific theme
alias wptua='wp theme update --all'         # Update all themes
alias wptucl='wp theme update --dry-run'    # Check for theme updates without applying

# --- Delete ---
alias wptr='wp theme delete'                # Remove (delete) a theme

# --- Info ---
alias wptver='wp theme get --field=version'           # Get installed version of a theme
alias wptpath='wp theme get --field=stylesheet_dir'   # Get filesystem path of a theme
