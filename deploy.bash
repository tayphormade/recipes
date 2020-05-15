#!/usr/bin/env bash
declare -r script=$(readlink -f $BASH_SOURCE)
declare -r script_dir=$(dirname $script)
set -e

# Generate hugo page
cd $script_dir
hugo -t ramium

# Commit page
cd public
git add .
message="$(date +'%Y-%m-%d %T'): Updating site"
git commit -m "$message"
git push origin master

