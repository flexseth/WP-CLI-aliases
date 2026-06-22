#!/usr/bin/env bash
# WP-CLI Database Aliases
# =======================
# Prefix: wpdb  (wp db ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpdbc     →  wp db create
#   wpdbd     →  wp db drop
#   wpdbi     →  wp db import
#   wpdbe     →  wp db export
#   wpdbq     →  wp db query
#   wpdbql    →  wp db query (opens MySQL prompt)
#   wpdbo     →  wp db optimize
#   wpdbr     →  wp db repair
#   wpdbck    →  wp db check
#   wpdbcl    →  wp db clean
#   wpdbsize  →  wp db size
#   wpdbpfx   →  wp db prefix
#   wpdbsrch  →  wp db search

# --- Create / Drop ---
alias wpdbc='wp db create'                  # Create the database defined in wp-config.php
alias wpdbd='wp db drop'                    # Drop the database (destructive!)
alias wpdbrd='wp db drop --yes'             # Drop without confirmation prompt

# --- Import / Export ---
alias wpdbi='wp db import'                  # Import a SQL file into the database
alias wpdbe='wp db export'                  # Export the database to a SQL file
alias wpdbets='wp db export --add-drop-table' # Export with DROP TABLE statements

# --- Query ---
alias wpdbq='wp db query'                   # Execute a SQL query
alias wpdbql='wp db cli'                    # Open interactive MySQL/MariaDB CLI

# --- Maintenance ---
alias wpdbo='wp db optimize'                # Optimize database tables
alias wpdbr='wp db repair'                  # Repair database tables
alias wpdbck='wp db check'                  # Check database tables for errors
alias wpdbcl='wp db clean'                  # Remove default WordPress data (dev use)

# --- Info ---
alias wpdbsize='wp db size'                 # Show database and table sizes
alias wpdbpfx='wp db prefix'                # Display the table prefix
alias wpdbsrch='wp db search'               # Search through the database for a string
alias wpdbcols='wp db columns'              # List columns for a table

# --- Reset ---
alias wpdbreset='wp db reset --yes'         # Drop and recreate the database
