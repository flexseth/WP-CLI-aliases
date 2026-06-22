#!/usr/bin/env bash
# WP-CLI Rewrite Aliases
# ======================
# Prefix: wprw  (wp rewrite ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wprwf     →  wp rewrite flush
#   wprwfh    →  wp rewrite flush --hard
#   wprwl     →  wp rewrite list
#   wprws     →  wp rewrite structure

# --- Flush ---
alias wprwf='wp rewrite flush'              # Flush rewrite rules (soft flush)
alias wprwfh='wp rewrite flush --hard'      # Hard flush — regenerates .htaccess / web.config

# --- List ---
alias wprwl='wp rewrite list'               # List rewrite rules registered in WordPress

# --- Structure ---
alias wprws='wp rewrite structure'          # Update the permalink structure
# Usage: wprws '/%postname%/' --category-base=topics
