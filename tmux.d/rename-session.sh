#!/bin/bash
cur=$(tmux display-message -p '#S')
read -e -p "Rename session: " -i "$cur" name
if [ -n "$name" ]; then
  tmux rename-session "$name"
fi
