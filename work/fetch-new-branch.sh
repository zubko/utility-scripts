#!/bin/bash
set -e

# Check if there are any changes in the work tree
if [ -n "$(git status --porcelain)" ]; then
    echo "There are changes in the work tree. Are you sure you want to switch to a new branch? (y/n)"
    read confirm
    if [ "$confirm" != "y" ]; then
        echo "Exiting..."
        exit 1
    fi
fi

# Get the branch name from the user
echo "Enter the branch name: "
read branch_name

# Check if the branch exists locally
if git rev-parse --verify --quiet "$branch_name" > /dev/null; then
    git checkout "$branch_name"
    branch_type="Local"
else
    git checkout -t "origin/$branch_name"
    branch_type="Remote"
fi

# Reset the staged changes
git reset

# Empty commit is needed for time calculation
git commit -m "empty" --allow-empty

echo "$branch_type branch '$branch_name' has been checked out"
