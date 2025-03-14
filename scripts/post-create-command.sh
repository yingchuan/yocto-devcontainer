#!/bin/bash

mkdir -p "$HOME/.bin"

if [ ! -f "$HOME/.bin/repo" ]; then
  echo "Downloading repo tool..."

  curl -fLo "$HOME/.bin/repo" https://storage.googleapis.com/git-repo-downloads/repo || {
    echo "Error: Failed to download repo" >&2
    exit 1
  }

  chmod a+rx "$HOME/.bin/repo"

  if ! grep -q 'export PATH=$HOME/.bin:$PATH' "$HOME/.bashrc"; then
    echo 'export PATH=$HOME/.bin:$PATH' >>"$HOME/.bashrc"
  fi

  if ! grep -q 'export PATH=$HOME/.bin:$PATH' "$HOME/.zshrc"; then
    echo 'export PATH=$HOME/.bin:$PATH' >>"$HOME/.zshrc"
  fi
fi

export PATH="$HOME/.bin:$PATH"
