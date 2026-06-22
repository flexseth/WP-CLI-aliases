#!/usr/bin/env bash
# WP-CLI Role & Capability Aliases
# =================================
# Prefixes:
#   wprl  (wp role ...)
#   wpcap (wp cap ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wprlc     →  wp role create
#   wprll     →  wp role list
#   wprld     →  wp role delete
#   wprlr     →  wp role reset
#   wpcapa    →  wp cap add
#   wpcapl    →  wp cap list
#   wpcapr    →  wp cap remove

# === ROLES ===

# --- Create ---
alias wprlc='wp role create'                # Create a new user role

# --- List ---
alias wprll='wp role list'                  # List all registered roles

# --- Delete ---
alias wprld='wp role delete'                # Delete a custom role

# --- Reset ---
alias wprlr='wp role reset'                 # Reset role capabilities to their defaults

# === CAPABILITIES ===

# --- Add ---
alias wpcapa='wp cap add'                   # Add a capability to a role
# Usage: wpcapa editor manage_options

# --- List ---
alias wpcapl='wp cap list'                  # List capabilities assigned to a role
# Usage: wpcapl administrator

# --- Remove ---
alias wpcapr='wp cap remove'                # Remove a capability from a role
# Usage: wpcapr editor manage_options
