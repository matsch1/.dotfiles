#!/bin/bash

git-autopush() {
  REPO_DIR = $1
  cd "$REPO_DIR" || {
    echo "Repository not found: $REPO_DIR"
    exit 1
  }

  # Check if the repository has changes
  if [[ -n $(git status --porcelain) ]]; then
    git add .
    git status

    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    git commit -m "Auto-commit: $TIMESTAMP"

    git push origin "$(git rev-parse --abbrev-ref HEAD)" || {
      echo "Failed to push changes."
      exit 1
    }

    echo "Changes pushed successfully."
  else
    # Check if there are committed changes to push
    LOCAL_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [[ -n $(git rev-list origin/"$LOCAL_BRANCH"..HEAD) ]]; then

      # Push changes
      git push origin "$LOCAL_BRANCH" || {
        echo "Failed to push changes."
        exit 1
      }
      echo "Changes pushed successfully."
    fi

  fi
}

git-autopush $1
