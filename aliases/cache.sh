#!/usr/bin/env bash
# WP-CLI Cache Aliases
# ====================
# Prefix: wpca  (wp cache ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpcaf     →  wp cache flush
#   wpcag     →  wp cache get
#   wpcaa     →  wp cache add
#   wpcas     →  wp cache set
#   wpcad     →  wp cache delete
#   wpcatype  →  wp cache type

# --- Flush ---
alias wpcaf='wp cache flush'                # Flush the entire object cache

# --- Read ---
alias wpcag='wp cache get'                  # Get a value from the object cache
alias wpcatype='wp cache type'              # Show the current cache backend (e.g., Redis, Memcached)

# --- Write ---
alias wpcaa='wp cache add'                  # Add a value to the object cache
alias wpcas='wp cache set'                  # Set (overwrite) a value in the object cache

# --- Delete ---
alias wpcad='wp cache delete'               # Remove a key from the object cache

# --- Transients (related) ---
alias wptrf='wp transient delete --all'     # Flush all transients from the database
alias wptrg='wp transient get'              # Get a transient value
alias wptrs='wp transient set'              # Set a transient value
alias wptrd='wp transient delete'           # Delete a specific transient
alias wptrl='wp transient list'             # List all transients
