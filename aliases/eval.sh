#!/usr/bin/env bash
# WP-CLI Eval Aliases
# ===================
# Prefixes:
#   wpev   (wp eval ...)
#   wpevf  (wp eval-file ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpev      →  wp eval
#   wpevf     →  wp eval-file
#   wpevurl   →  wp eval (print site URL)
#   wpevpath  →  wp eval (print ABSPATH)
#   wpevajax  →  wp eval (trigger wp_ajax action)

# --- Eval (inline PHP) ---
alias wpev='wp eval'                        # Execute arbitrary PHP code in WordPress context
# Usage: wpev 'echo get_option("siteurl");'

# --- Eval-file ---
alias wpevf='wp eval-file'                  # Execute a PHP file in WordPress context
# Usage: wpevf my-script.php

# --- Common one-liners ---
alias wpevurl="wp eval 'echo home_url();'"              # Print the home URL
alias wpevpath="wp eval 'echo ABSPATH;'"                # Print WordPress root path
alias wpevmail="wp eval 'echo get_option(\"admin_email\");'"  # Print admin email
alias wpevver="wp eval 'global \$wp_version; echo \$wp_version;'"  # Print WP version via PHP
alias wpevis="wp eval 'echo is_multisite() ? \"Multisite\" : \"Single site\";'"  # Check multisite
