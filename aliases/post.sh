#!/usr/bin/env bash
# WP-CLI Post Aliases
# ===================
# Prefix: wppo  (wp post ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wppoc     →  wp post create
#   wppog     →  wp post get
#   wppol     →  wp post list
#   wppou     →  wp post update
#   wppor     →  wp post delete
#   wppoe     →  wp post edit
#   wppometa  →  wp post meta (followed by get/update/delete/add)
#   wppolist  →  wp post list --post_type=post
#   wppopages →  wp post list --post_type=page

# --- Create ---
alias wppoc='wp post create'                # Create a new post
alias wppodraft='wp post create --post_status=draft'  # Create a draft post

# --- Read ---
alias wppog='wp post get'                   # Get details of a specific post
alias wppol='wp post list'                  # List posts
alias wppolist='wp post list --post_type=post'         # List posts of type 'post'
alias wppopages='wp post list --post_type=page'        # List pages only
alias wppocpt='wp post list --post_type='              # List custom post type (append type)
alias wppopub='wp post list --post_status=publish'     # List published posts
alias wppodrft='wp post list --post_status=draft'      # List draft posts
alias wppotrs='wp post list --post_status=trash'       # List trashed posts

# --- Update ---
alias wppou='wp post update'                # Update a post by ID
alias wppopub1='wp post update --post_status=publish'  # Publish a post by ID
alias wppoe='wp post edit'                  # Open a post in $EDITOR

# --- Delete ---
alias wppor='wp post delete'                # Trash a post
alias wpporf='wp post delete --force'       # Permanently delete a post (skip trash)

# --- Meta ---
alias wppomg='wp post meta get'             # Get a post meta value
alias wppomu='wp post meta update'          # Update a post meta value
alias wppomr='wp post meta delete'          # Delete a post meta key
alias wppoml='wp post meta list'            # List all meta for a post
