#!/bin/bash

# GitHub repository
REPO_URL="https://github.com/djredman99/pre-post-runner-jobs"
echo "-================TOKEN================-"
echo $GITHUB_TOKEN

# Check if the token is provided
if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GITHUB_TOKEN environment variable is not set."
  #exit 1
fi
echo "-================PWD================-"
pwd
echo "-================LS================-"
ls -la
echo "-================TESTING SECRET with ${{}}================-"
echo ${{ secrets.TESTING_SECRET }}
echo "-================TESTING SECRET in a string================-"
echo "TESTING SECRET is: ${{ secrets.TESTING_SECRET }}"

TOKEN=$(curl -X POST -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/djredman99-org/pre-post-runner-jobs/actions/runners/registration-token | jq -r .token)

echo "Your registration token is: $TOKEN"
# Configure the runner
#./config.sh --url $REPO_URL --token $GITHUB_TOKEN

# Run the runner
#./run.sh