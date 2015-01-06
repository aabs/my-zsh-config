#!/bin/bash

# Usage:
#     git-autocommit <dir> 

# 1. switch to root of git working dir 
pushd .
cd $1
# 2. stage any untracked changes
# 3. stash the changes
git stash

popd
