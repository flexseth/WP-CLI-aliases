#!/usr/bin/env bash
# WP-CLI Cron Aliases
# ===================
# Prefix: wpcr  (wp cron ...)
#
# QUICK REFERENCE:
#   alias     →  wp command
#   --------     -----------------------------------
#   wpcrl     →  wp cron event list
#   wpcrr     →  wp cron event run
#   wpcrc     →  wp cron event create
#   wpcrd     →  wp cron event delete
#   wpcrn     →  wp cron event next
#   wpcrsl    →  wp cron schedule list
#   wpcrt     →  wp cron test

# --- Events ---
alias wpcrl='wp cron event list'            # List scheduled cron events
alias wpcrr='wp cron event run'             # Run a specific cron event
alias wpcrc='wp cron event create'          # Create a new cron event
alias wpcrd='wp cron event delete'          # Delete a cron event
alias wpcrn='wp cron event next'            # Show the next run time for an event

# --- Schedules ---
alias wpcrsl='wp cron schedule list'        # List registered cron schedules (intervals)

# --- Test ---
alias wpcrt='wp cron test'                  # Test WP-Cron functionality
alias wpcrrun='wp cron event run --due-now' # Run all cron events that are due right now
