#!/usr/bin/env bash
# WP-CLI Media Aliases
# ====================
# Prefix: wpmdi  (wp media ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpmdii    →  wp media import
#   wpmdiis   →  wp media import (featured image)
#   wpmdireg  →  wp media regenerate
#   wpmdirall →  wp media regenerate --all
#   wpmdil    →  wp post list --post_type=attachment

# --- Import ---
alias wpmdii='wp media import'              # Import a file into the media library
alias wpmdiif='wp media import --featured-image'  # Import as featured image for a post

# --- Regenerate ---
alias wpmdireg='wp media regenerate'        # Regenerate thumbnails for specific attachment(s)
alias wpmdirall='wp media regenerate --all' # Regenerate all media thumbnails (may be slow)
alias wpmdiryep='wp media regenerate --all --yes'  # Regenerate all thumbnails without prompt

# --- Image Sizes ---
alias wpmdiis='wp media image-size'         # List registered image sizes

# --- List Attachments ---
alias wpmdil='wp post list --post_type=attachment'           # List all media attachments
alias wpmdilimg='wp post list --post_type=attachment --mime-type=image'  # List images only
