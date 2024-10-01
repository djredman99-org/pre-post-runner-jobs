#!/bin/bash

echo "The value of GITHUB_EVENT_PATH is: $GITHUB_EVENT_PATH"

echo "-======== SHOWING GITHUB_EVENT_PATH =======-"
cat $GITHUB_EVENT_PATH

EVENT_DATA=$(jq -r . $GITHUB_EVENT_PATH)
WORKFLOW=$(echo "$EVENT_DATA" | jq -r '.workflow')
echo "The value of the workflow object is: $WORKFLOW"


# What else do we have?
# NO CONTEXTS
#GITHUB_CONTEXT=${{ toJson(github) }}
#echo "$GITHUB_CONTEXT"

echo "-======== WHERE IS MY STEP SUMMARY =======-"
echo $GITHUB_STEP_SUMMARY

#Setting a step summary
echo "-======== Setting a JOB summary =======-"
echo "I am a pre-job running on the runner and here are some things I know"  >> $GITHUB_STEP_SUMMARY
echo "" >> $GITHUB_STEP_SUMMARY # this is a blank line
echo "- The workflow that is running: $GITHUB_WORKFLOW" >> $GITHUB_STEP_SUMMARY
echo "- This is who triggered this workflow: $GITHUB_TRIGGERING_ACTOR" >> $GITHUB_STEP_SUMMARY
echo "- I am executing on runner: $RUNNER_NAME" >> $GITHUB_STEP_SUMMARY
echo "" >> $GITHUB_STEP_SUMMARY # this is a blank line
echo "The workflow that is executing is:" >> $GITHUB_STEP_SUMMARY



#echo "PWD"
#pwd
cat /workspaces/WorkflowDemos/$WORKFLOW >> $GITHUB_STEP_SUMMARY

echo "-======== Making some decicions to continue or not =======-"
if (true); then
  echo "We are going to continue"
  exit 0
else
  echo "We are not going to continue"
  exit 1
fi
