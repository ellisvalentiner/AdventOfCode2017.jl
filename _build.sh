#!/bin/bash
set -e

echo -e "\033[0;32mRunning tests...\033[0m"
julia -e 'Pkg.test("AdventOfCode2017");'

echo -e "\033[0;32mRebuilding README.md...\033[0m"
julia -e 'using Weave; weave("README.jl", "github");'

# Get current branch
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

# Add changes to git.
git add -A

# Commit changes.
msg="README rebuilt using Weave"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg" -q

# Push source and build repos.
echo -e "\033[0;32mPushing to GitHub...\033[0m"
git push origin $branch -q
