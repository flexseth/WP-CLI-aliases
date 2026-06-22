#!/usr/bin/env bash
# WP-CLI Option Aliases
# =====================
# Prefix: wpop  (wp option ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpopg     →  wp option get
#   wpopa     →  wp option add
#   wpopu     →  wp option update
#   wpopr     →  wp option delete
#   wpopl     →  wp option list
#   wpopurl   →  wp option get siteurl
#   wpopname  →  wp option get blogname
#   wpopemail →  wp option get admin_email

# --- Get ---
alias wpopg='wp option get'                 # Get the value of an option
alias wpopurl='wp option get siteurl'       # Get the site URL
alias wpopname='wp option get blogname'     # Get the site name
alias wpopemail='wp option get admin_email' # Get the admin email
alias wpoptheme='wp option get stylesheet'  # Get the active theme

# --- Add & Update ---
alias wpopa='wp option add'                 # Add a new option (fails if key exists)
alias wpopu='wp option update'              # Update an existing option value

# --- Delete ---
alias wpopr='wp option delete'              # Delete an option by name

# --- List ---
alias wpopl='wp option list'                # List all options
alias wpopauto='wp option list --search=auto*'        # List auto-* options
alias wpopmailr='wp option get mailserver_url'        # Get mail server URL

# --- Autoload ---
alias wpopaly='wp option list --autoload=yes'   # List options that autoload
alias wpopaln='wp option list --autoload=no'    # List options that do not autoload
