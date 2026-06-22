#!/usr/bin/env bash
# WP-CLI Comment Aliases
# ======================
# Prefix: wpcom  (wp comment ...)
#
# QUICK REFERENCE:
#   alias      →  wp command
#   ---------     -----------------------------------
#   wpcomc     →  wp comment create
#   wpcomg     →  wp comment get
#   wpcoml     →  wp comment list
#   wpcomu     →  wp comment update
#   wpcomr     →  wp comment delete
#   wpcomapp   →  wp comment approve
#   wpcomuna   →  wp comment unapprove
#   wpcomsp    →  wp comment spam
#   wpcomtrs   →  wp comment trash
#   wpcomcnt   →  wp comment count
#   wpcomgen   →  wp comment generate

# --- Create ---
alias wpcomc='wp comment create'            # Create a new comment

# --- Read ---
alias wpcomg='wp comment get'               # Get details of a specific comment
alias wpcoml='wp comment list'              # List comments
alias wpcomlapp='wp comment list --status=approve'   # List approved comments
alias wpcomltrs='wp comment list --status=trash'     # List trashed comments
alias wpcomlsp='wp comment list --status=spam'       # List spam comments
alias wpcomcnt='wp comment count'           # Count comments (total, per status)

# --- Update ---
alias wpcomu='wp comment update'            # Update a comment by ID

# --- Moderation ---
alias wpcomapp='wp comment approve'         # Approve a comment
alias wpcomuna='wp comment unapprove'       # Unapprove a comment
alias wpcomsp='wp comment spam'             # Mark a comment as spam
alias wpcomtrs='wp comment trash'           # Move a comment to trash

# --- Delete ---
alias wpcomr='wp comment delete'            # Delete a comment

# --- Generate ---
alias wpcomgen='wp comment generate'        # Generate dummy comments
