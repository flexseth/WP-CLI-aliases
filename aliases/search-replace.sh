#!/usr/bin/env bash
# WP-CLI Search-Replace Aliases
# ==============================
# Prefix: wpsr  (wp search-replace ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpsr      →  wp search-replace
#   wpsrd     →  wp search-replace --dry-run
#   wpsrp     →  wp search-replace (precise / no regex)
#   wpsrre    →  wp search-replace --regex
#   wpsrall   →  wp search-replace across all tables
#   wpsrex    →  wp search-replace --export

# --- Basic ---
alias wpsr='wp search-replace'              # Search and replace a string in the database
alias wpsrd='wp search-replace --dry-run'   # Preview replacements without making changes

# --- Options ---
alias wpsrp='wp search-replace --precise'   # Use precise replacement (no partial matches on serialized)
alias wpsrre='wp search-replace --regex'    # Use regular expressions in the search pattern
alias wpsrall='wp search-replace --all-tables'  # Search all DB tables (not just WP tables)

# --- Export result ---
alias wpsrex='wp search-replace --export'   # Run search-replace and export as SQL
alias wpsrexd='wp search-replace --export --dry-run'  # Preview and export diff as SQL

# --- Common workflow: swap domains ---
# Usage: wpsr 'http://old-site.com' 'https://new-site.com'
# Tip:   add --dry-run first to preview, then run without it
