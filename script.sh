#!/bin/bash


total_commits=$(git rev-list --count HEAD)

dest="PATH"

# Repository URL
repo="REPO_LINK"


for ((commit=1; commit<=$total_commits; commit++)); do
    echo "Checking out commit number: $commit"
    
    mkdir -p "$dest/$commit"
    git clone -q $repo "$dest/$commit"
    cd "$dest/$commit"
    commit_hash=$(git rev-list --reverse HEAD | sed -n ${commit}p)
    
    git checkout -q $commit_hash

    git reset --hard -q $commit_hash
done
