#!/bin/bash

# Usage:
#     git-autocommit <dir> 

# 1. switch to root of git working dir 
pushd .
cd $1
# 2. stage any untracked changes
# 3. stash the changes

logger -t git stashing changes on: $1

git stash

popd
