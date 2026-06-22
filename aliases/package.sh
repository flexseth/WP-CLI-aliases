#!/usr/bin/env bash
# WP-CLI Package Aliases
# ======================
# Prefix: wppkg  (wp package ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wppkgi    →  wp package install
#   wppkgl    →  wp package list
#   wppkgr    →  wp package remove
#   wppkgu    →  wp package update
#   wppkgbr   →  wp package browse
#   wppkgp    →  wp package path

# --- Install ---
alias wppkgi='wp package install'           # Install a WP-CLI community package

# --- List ---
alias wppkgl='wp package list'              # List all installed WP-CLI packages

# --- Update ---
alias wppkgu='wp package update'            # Update all installed packages

# --- Remove ---
alias wppkgr='wp package remove'            # Remove an installed package

# --- Browse ---
alias wppkgbr='wp package browse'           # Browse packages available in the WP-CLI repository
alias wppkgbrall='wp package browse --all'  # List all available community packages

# --- Path ---
alias wppkgp='wp package path'              # Print the path to the WP-CLI packages directory
