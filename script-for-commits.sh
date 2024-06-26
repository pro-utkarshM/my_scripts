#!/bin/bash


total_commits=$(git rev-list --count HEAD)

dest="./DEST"

# Repository URL
repo="REPO_URL"
    cd "$dest"


for ((commit=1; commit<=$total_commits; commit++)); do
    echo "Checking out commit number: $commit"

    mkdir -p "$commit"
    git clone -q $repo "$commit"
    cd "$commit"
    commit_hash=$(git rev-list --reverse HEAD | sed -n ${commit}p)
    git checkout -q $commit_hash
    git reset --hard -q $commit_hash
    
    cd ..
done
