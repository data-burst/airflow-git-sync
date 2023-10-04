#!/bin/sh
PROJECT_DIRECTORY="/app/${DIRECTORY_NAME:-project}"
SUBFOLDER=${SUBFOLDER_PATH:-""}  # Fetch the sub-folder path from an environment variable

mkdir -p ~/.ssh

if [ ! -d "$PROJECT_DIRECTORY/.git" ]; then
  echo "Cloning the repository: $REPO_URL"
  mkdir -p $PROJECT_DIRECTORY
  ssh-keyscan ${GIT_URL:-github.com} >> ~/.ssh/known_hosts
  git init $PROJECT_DIRECTORY
  cd $PROJECT_DIRECTORY
  git remote add origin $REPO_URL
  git pull origin ${GIT_BRANCH:-main}
  rsync -vazC $PROJECT_DIRECTORY/$SUBFOLDER ${DESTINATION_PATH:-/app/sync}
fi

if [[ "$PWD" != "$PROJECT_DIRECTORY" ]]
then
    cd "$PROJECT_DIRECTORY"
fi

while true; do
  echo "Syncing the repository every $INTERVAL seconds"
  git -C $PROJECT_DIRECTORY pull origin ${GIT_BRANCH:-main}
  git clean -fd
  sleep ${INTERVAL:-10}
  if [ -z "$SUBFOLDER" ]; then
    rsync -vazC $PROJECT_DIRECTORY/ ${DESTINATION_PATH:-/app/sync}
  else
    rsync -vazC $PROJECT_DIRECTORY/$SUBFOLDER ${DESTINATION_PATH:-/app/sync}
  fi
done