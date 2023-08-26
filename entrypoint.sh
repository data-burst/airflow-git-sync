#!/bin/sh
mkdir -p ~/.ssh

if [ ! -d "/app/${DIRECTORY_NAME:-project}/.git" ]; then
  echo "Cloning the repository: $REPO_URL"
  mkdir -p /app/${DIRECTORY_NAME:-project}
  ssh-keyscan ${GIT_URL:-github.com} >> ~/.ssh/known_hosts
  git init /app/${DIRECTORY_NAME:-project}
  cd /app/${DIRECTORY_NAME:-project}
  git remote add origin $REPO_URL
  git pull origin ${GIT_BRANCH:-main}
  rsync -vazC /app/${DIRECTORY_NAME:-project}/ ${DESTINATION_PATH:-/app/sync}
fi

while true; do
  echo "Syncing the repository every $INTERVAL seconds"
  git -C /app/${DIRECTORY_NAME:-project} pull origin ${GIT_BRANCH:-main}
  git clean -fd
  sleep ${INTERVAL:-10}
  rsync -vazC /app/${DIRECTORY_NAME:-project}/ ${DESTINATION_PATH:-/app/sync}
done

