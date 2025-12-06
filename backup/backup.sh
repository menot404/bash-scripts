#!/bin/bash

# Check to make sure the user has entered exactly two arguments

if [ $# -ne 2 ]; then
    echo "Usage: backup.sh <source_directory> <target_directory>"
    echo "Please try again"
    exit 1
fi

# Check to see if rsync is installed

if ! command -v rsync > /dev/null 2>&1; then
    echo "This scripts requireres rsync to be installed"
    echo "Please use your distribution's package manager to install it and try again."
    exit 2
fi