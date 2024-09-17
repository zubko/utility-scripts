#!/bin/bash

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

git fetch origin $branch_name
git checkout -t origin/$branch_name
git reset
git commit -m "empty" --allow-empty

echo "Branch $branch_name has been pulled"
