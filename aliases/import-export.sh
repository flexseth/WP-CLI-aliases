#!/usr/bin/env bash
# WP-CLI Import & Export Aliases
# ================================
# Prefixes:
#   wpimp  (wp import ...)
#   wpexp  (wp export ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpimp     →  wp import
#   wpimpa    →  wp import --authors=create
#   wpexp     →  wp export
#   wpexpa    →  wp export --all
#   wpexpp    →  wp export --post_type=post
#   wpexppage →  wp export --post_type=page
#   wpexpdir  →  wp export --dir=

# === IMPORT ===
alias wpimp='wp import'                     # Import content from a WXR (XML) file
alias wpimpa='wp import --authors=create'   # Import content, creating new authors as needed
alias wpimps='wp import --authors=skip'     # Import content, skipping unknown authors

# === EXPORT ===
alias wpexp='wp export'                     # Export content to a WXR (XML) file
alias wpexpa='wp export --all'              # Export all content
alias wpexpp='wp export --post_type=post'   # Export posts only
alias wpexppage='wp export --post_type=page'  # Export pages only
alias wpexpdir='wp export --dir='           # Export to a specific directory (append path)
alias wpexppub='wp export --post_status=publish'  # Export published content only
