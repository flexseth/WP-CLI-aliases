#!/usr/bin/env bash
# WP-CLI Config Aliases
# =====================
# Prefix: wpcfg  (wp config ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpcfgc    →  wp config create
#   wpcfgg    →  wp config get
#   wpcfgs    →  wp config set
#   wpcfgd    →  wp config delete
#   wpcfgl    →  wp config list
#   wpcfgp    →  wp config path
#   wpcfghas  →  wp config has
#   wpcfgsh   →  wp config shuffle-salts

# --- Create ---
alias wpcfgc='wp config create'             # Generate a wp-config.php file
alias wpcfgcsk='wp config create --skip-check'  # Create wp-config.php without DB check

# --- Read ---
alias wpcfgg='wp config get'                # Get the value of a constant or variable
alias wpcfgl='wp config list'               # List all constants and variables
alias wpcfgp='wp config path'               # Print the path to wp-config.php
alias wpcfghas='wp config has'              # Check if a constant or variable exists

# --- Update / Set ---
alias wpcfgs='wp config set'                # Set a constant or variable in wp-config.php

# --- Delete ---
alias wpcfgd='wp config delete'             # Delete a constant or variable from wp-config.php

# --- Salts ---
alias wpcfgsh='wp config shuffle-salts'     # Refresh the secret keys and salts in wp-config.php
