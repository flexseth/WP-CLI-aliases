#!/usr/bin/env bash
# WP-CLI User Aliases
# ===================
# Prefix: wpu  (wp user ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpuc      →  wp user create
#   wpug      →  wp user get
#   wpul      →  wp user list
#   wpuu      →  wp user update
#   wpur      →  wp user delete
#   wpupass   →  wp user update --user_pass=
#   wpurole   →  wp user add-role / remove-role
#   wpumg     →  wp user meta get
#   wpumu     →  wp user meta update
#   wpuml     →  wp user meta list

# --- Create ---
alias wpuc='wp user create'                 # Create a new user
alias wpucadm='wp user create --role=administrator'  # Create an admin user

# --- Read ---
alias wpug='wp user get'                    # Get details of a specific user
alias wpul='wp user list'                   # List all users
alias wpula='wp user list --role=administrator'       # List administrators
alias wpule='wp user list --role=editor'              # List editors
alias wpulauth='wp user list --role=author'           # List authors
alias wpulsub='wp user list --role=subscriber'        # List subscribers

# --- Update ---
alias wpuu='wp user update'                 # Update a user by ID or login
alias wpupass='wp user update --user_pass=' # Update a user password (append new pass)

# --- Roles ---
alias wpurar='wp user add-role'             # Add a role to a user
alias wpurrr='wp user remove-role'          # Remove a role from a user
alias wpusetr='wp user set-role'            # Set (replace) a user's role

# --- Delete ---
alias wpur='wp user delete'                 # Delete a user
alias wpurr='wp user delete --reassign='    # Delete user and reassign their posts

# --- Meta ---
alias wpumg='wp user meta get'              # Get a user meta value
alias wpumu='wp user meta update'           # Update a user meta value
alias wpumr='wp user meta delete'           # Delete a user meta key
alias wpuml='wp user meta list'             # List all meta for a user

# --- Misc ---
alias wpugen='wp user generate'             # Generate dummy users
alias wpuchk='wp user check-password'       # Check a user's password
