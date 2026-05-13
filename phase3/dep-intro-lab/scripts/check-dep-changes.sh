#!/bin/bash

set -e #exit immediately if a command exits with a non-zero status

echo "Checking for dependency introduction..."

CHANGED_FILES=$(git diff --name-only HEAD~1 HEAD)

echo "Changed files:"
echo "$CHANGED_FILES"

#Detect package manifest changes
if echo "$CHANGED_FILES" | grep -q "package.json"; then #-q for quiet, returns 0 if match is found
    echo "package.json has been modified. Checking for new dependencies..."

    #show added lines only
    ADDED_LINES=$(git diff HEAD~1 HEAD -- package.json | grep '^+[^+]' || true) #lines starting with + but not ++

    echo "Added lines:"
    echo "$ADDED_LINES"

    #detect dependency sections
    if echo "$ADDED_LINES" | grep -q '"dependencies"\|"devDependencies"'; then
        echo "Potential dependency introduction detected in package.json!"
        exit 1
    fi
        echo "No new dependencies found in package.json."
fi

echo "No dependency introduction detected"