#!/usr/bin/env bash
# WP-CLI Term (Taxonomy Term) Aliases
# ====================================
# Prefix: wptm  (wp term ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wptmc     →  wp term create
#   wptmg     →  wp term get
#   wptml     →  wp term list
#   wptmu     →  wp term update
#   wptmr     →  wp term delete
#   wptmmg    →  wp term meta get
#   wptmmu    →  wp term meta update
#   wptmml    →  wp term meta list
#   wptmgen   →  wp term generate

# --- Create ---
alias wptmc='wp term create'                # Create a new taxonomy term
# Usage: wptmc category "My Category" --description="..." --slug=my-cat

# --- Read ---
alias wptmg='wp term get'                   # Get details of a term
alias wptml='wp term list'                  # List terms for a taxonomy
alias wptmtags='wp term list post_tag'      # List all tags
alias wptmcats='wp term list category'      # List all categories

# --- Update ---
alias wptmu='wp term update'                # Update a term's details

# --- Delete ---
alias wptmr='wp term delete'                # Delete a term

# --- Meta ---
alias wptmmg='wp term meta get'             # Get a term meta value
alias wptmmu='wp term meta update'          # Update a term meta value
alias wptmmr='wp term meta delete'          # Delete a term meta key
alias wptmml='wp term meta list'            # List all meta for a term

# --- Generate ---
alias wptmgen='wp term generate'            # Generate dummy terms
