#!/bin/bash
read -e -p "New session: " name
if [ -n "$name" ]; then
  tmux new-session -d -s "$name"
  tmux switch-client -t "$name"
fi
