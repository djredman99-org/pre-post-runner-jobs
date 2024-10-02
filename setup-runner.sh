#!/bin/bash

# GitHub repository
REPO_URL="https://github.com/djredman99/pre-post-runner-jobs"

# Check if the token is provided
if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GITHUB_TOKEN environment variable is not set."
  exit 1
fi

pwd

ls -la

# Configure the runner
./config.sh --url $REPO_URL --token $GITHUB_TOKEN

# Run the runner
./run.sh