#!/usr/bin/env bash
# WP-CLI Scaffold Aliases
# =======================
# Prefix: wpscaf  (wp scaffold ...)
#
# QUICK REFERENCE:
#   alias       →  wp command
#   ----------     -----------------------------------
#   wpscafp     →  wp scaffold plugin
#   wpscaft     →  wp scaffold _s (starter theme)
#   wpscafct    →  wp scaffold child-theme
#   wpscafcpt   →  wp scaffold post-type
#   wpscafx     →  wp scaffold taxonomy
#   wpscafbl    →  wp scaffold block
#   wpscaftest  →  wp scaffold plugin-tests
#   wpscafthtest→  wp scaffold theme-tests

# --- Plugin ---
alias wpscafp='wp scaffold plugin'          # Generate a new plugin with boilerplate code
alias wpscafpunit='wp scaffold plugin-tests'  # Generate PHPUnit test scaffolding for a plugin

# --- Theme ---
alias wpscaft='wp scaffold _s'              # Generate an _Underscores (_s) starter theme
alias wpscafct='wp scaffold child-theme'    # Generate a child theme boilerplate
alias wpscafthunit='wp scaffold theme-tests' # Generate PHPUnit test scaffolding for a theme

# --- Post Types & Taxonomies ---
alias wpscafcpt='wp scaffold post-type'     # Generate code for a custom post type
alias wpscafx='wp scaffold taxonomy'        # Generate code for a custom taxonomy

# --- Blocks ---
alias wpscafbl='wp scaffold block'          # Generate a Gutenberg block scaffold

# --- Misc ---
alias wpscafvagrant='wp scaffold package'   # Scaffold a WP-CLI package (for package authors)
