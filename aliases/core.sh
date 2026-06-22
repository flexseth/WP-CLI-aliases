#!/usr/bin/env bash
# WP-CLI Core Aliases
# ===================
# Prefix: wpc  (wp core ...)
#
# QUICK REFERENCE:
#   alias    →  wp command
#   -------     --------------------
#   wpcd     →  wp core download
#   wpci     →  wp core install
#   wpcu     →  wp core update
#   wpcudb   →  wp core update-db
#   wpcv     →  wp core verify-checksums
#   wpcver   →  wp core version
#   wpcinfo  →  wp core version --extra

# --- Download & Install ---
alias wpcd='wp core download'           # Download WordPress core files
alias wpci='wp core install'            # Install WordPress (configure wp-config & run install)
alias wpcudb='wp core update-db'        # Upgrade the WordPress database after a core update

# --- Updates ---
alias wpcu='wp core update'             # Update WordPress core to the latest version
alias wpcucl='wp core update --dry-run' # Check for core updates without applying them

# --- Verification ---
alias wpcv='wp core verify-checksums'   # Verify WordPress files against official checksums

# --- Version Info ---
alias wpcver='wp core version'          # Display the current WordPress version
alias wpcinfo='wp core version --extra' # Display version with PHP/MySQL/WP-CLI info
