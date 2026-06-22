#!/usr/bin/env bash
# WP-CLI Popular Aliases
# ======================
# A curated set of the most frequently used WP-CLI shortcuts.
# These are the "greatest hits" — install this file alone for
# a lean, high-value alias set.
#
# Source this file in your shell config:
#   source /path/to/WP-CLI-aliases/popular.sh
#
# Or install via:
#   ./install.sh --popular
#
# QUICK REFERENCE:
#   Category     Alias       →  wp command
#   ----------   ---------      -------------------------------------------
#   Core         wpcver      →  wp core version
#                wpcu        →  wp core update
#                wpcudb      →  wp core update-db
#   Plugin       wppi        →  wp plugin install
#                wppia       →  wp plugin install --activate
#                wppa        →  wp plugin activate
#                wppd        →  wp plugin deactivate
#                wppl        →  wp plugin list
#                wppu        →  wp plugin update
#                wppua       →  wp plugin update --all
#                wppr        →  wp plugin delete
#   Theme        wpti        →  wp theme install
#                wptia       →  wp theme install --activate
#                wpta        →  wp theme activate
#                wptl        →  wp theme list
#                wptu        →  wp theme update
#                wptua       →  wp theme update --all
#   Database     wpdbi       →  wp db import
#                wpdbe       →  wp db export
#                wpdbq       →  wp db query
#                wpdbsize    →  wp db size
#   Search       wpsr        →  wp search-replace
#                wpsrd       →  wp search-replace --dry-run
#   Cache        wpcaf       →  wp cache flush
#                wptrf       →  wp transient delete --all
#   User         wpul        →  wp user list
#                wpuc        →  wp user create
#   Option       wpopg       →  wp option get
#                wpopu       →  wp option update
#   Config       wpcfgsh     →  wp config shuffle-salts
#   Rewrite      wprwf       →  wp rewrite flush
#                wprwfh      →  wp rewrite flush --hard
#   Cron         wpcrl       →  wp cron event list
#                wpcrrun     →  wp cron event run --due-now

# ── Core ──────────────────────────────────────────────────────────────
alias wpcver='wp core version'              # Show current WordPress version
alias wpcu='wp core update'                 # Update WordPress core
alias wpcudb='wp core update-db'            # Update the WordPress database schema

# ── Plugin ────────────────────────────────────────────────────────────
alias wppi='wp plugin install'              # Install a plugin
alias wppia='wp plugin install --activate'  # Install and activate a plugin
alias wppa='wp plugin activate'             # Activate a plugin
alias wppd='wp plugin deactivate'           # Deactivate a plugin
alias wppl='wp plugin list'                 # List all plugins
alias wppu='wp plugin update'               # Update a plugin
alias wppua='wp plugin update --all'        # Update all plugins
alias wppr='wp plugin delete'               # Delete a plugin

# ── Theme ──────────────────────────────────────────────────────────────
alias wpti='wp theme install'               # Install a theme
alias wptia='wp theme install --activate'   # Install and activate a theme
alias wpta='wp theme activate'              # Activate a theme
alias wptl='wp theme list'                  # List all themes
alias wptu='wp theme update'                # Update a theme
alias wptua='wp theme update --all'         # Update all themes

# ── Database ───────────────────────────────────────────────────────────
alias wpdbi='wp db import'                  # Import a database SQL file
alias wpdbe='wp db export'                  # Export the database to a SQL file
alias wpdbq='wp db query'                   # Run a SQL query
alias wpdbsize='wp db size'                 # Show database size

# ── Search-Replace ─────────────────────────────────────────────────────
alias wpsr='wp search-replace'              # Search and replace in the database
alias wpsrd='wp search-replace --dry-run'   # Preview search-replace changes

# ── Cache & Transients ─────────────────────────────────────────────────
alias wpcaf='wp cache flush'                # Flush the object cache
alias wptrf='wp transient delete --all'     # Delete all transients

# ── User ───────────────────────────────────────────────────────────────
alias wpul='wp user list'                   # List all users
alias wpuc='wp user create'                 # Create a user

# ── Options ────────────────────────────────────────────────────────────
alias wpopg='wp option get'                 # Get a WordPress option
alias wpopu='wp option update'              # Update a WordPress option

# ── Config ─────────────────────────────────────────────────────────────
alias wpcfgsh='wp config shuffle-salts'     # Refresh security salts in wp-config.php

# ── Rewrite ────────────────────────────────────────────────────────────
alias wprwf='wp rewrite flush'              # Flush rewrite rules
alias wprwfh='wp rewrite flush --hard'      # Hard flush rewrite rules

# ── Cron ───────────────────────────────────────────────────────────────
alias wpcrl='wp cron event list'            # List scheduled cron events
alias wpcrrun='wp cron event run --due-now' # Run all due cron events now
