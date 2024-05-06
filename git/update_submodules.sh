#!/bin/zsh

# Update all submodules to the latest commit on the default branch
# (usually master, main or release)
git submodule foreach "(git checkout master || git checkout main || git checkout release; git pull)"
