#!/bin/bash

compress-images() {
  local image extension
  declare -A seen_images
  FAILED_IMAGES=()

  if ! command -v mogrify >/dev/null 2>&1; then
    echo "mogrify is not installed."
    if command -v yay >/dev/null 2>&1; then
      if [[ $EUID -eq 0 ]]; then
        yay -S --needed --noconfirm imagemagick
      else
        yay -S --needed --noconfirm --sudoflags "-n" imagemagick
      fi
    elif command -v apt-get >/dev/null 2>&1; then
      if [[ $EUID -eq 0 ]]; then
        apt-get install --yes imagemagick
      else
        sudo -n apt-get install --yes imagemagick
      fi
    else
      echo "Skipping image compression: no supported package manager found."
      return
    fi

    if ! command -v mogrify >/dev/null 2>&1; then
      echo "Skipping image compression: ImageMagick could not be installed without prompting for sudo."
      return
    fi
  fi

  while IFS= read -r -d '' image; do
    [[ ${seen_images["$image"]+_} ]] && continue
    seen_images["$image"]=1
    [[ -f "$image" ]] || continue
    extension=${image##*.}
    extension=${extension,,}

    case "$extension" in
      jpg|jpeg|png|webp)
        echo "Compressing image: $image"
        mogrify -strip -quality 85 "$image" || {
          echo "Failed to compress image: $image"
          FAILED_IMAGES+=("$image")
        }
        ;;
    esac
  done < <(git diff --name-only -z HEAD; git ls-files --others --exclude-standard -z)
}

git-autopush() {
  REPO_DIR=$1
  cd "$REPO_DIR" || {
    echo "Repository not found: $REPO_DIR"
    exit 1
  }

  echo "Git autopush ${REPO_DIR}"
  compress-images

  # Check if the repository has changes
  if [[ -n $(git status --porcelain) ]]; then
    git add .

    # Do not commit images that could not be compressed.
    for image in "${FAILED_IMAGES[@]}"; do
      git restore --staged -- "$image"
    done

    if ! git diff --cached --quiet; then
      git status

      TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
      git commit -m "Auto-commit: $TIMESTAMP"
    else
      echo "No changes to commit."
    fi
  fi

  # Check if there are committed changes to push.
  LOCAL_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  if [[ -n $(git rev-list origin/"$LOCAL_BRANCH"..HEAD) ]]; then
    git push origin "$LOCAL_BRANCH" || {
      echo "Failed to push changes."
      exit 1
    }
    echo "Changes pushed successfully."
  fi
}

git-autopush $1
