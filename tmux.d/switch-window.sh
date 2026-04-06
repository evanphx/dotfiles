#!/bin/bash
last=$(tmux display-message -p '#{client_last_session}')

target=$(
  tmux list-windows -a -F '#{session_name}:#{window_index}  #{window_name}  #{pane_title}' |
  awk -v last="$last:" 'BEGIN{OFS=""} index($1,last)==1{print "0 ",$0; next}{print "1 ",$0}' |
  sort -t' ' -k1,1 -k2 |
  cut -d' ' -f2- |
  fzf --reverse --header='Switch Window' \
      --preview='tmux capture-pane -ep -t {1} | tail -50' \
      --preview-window=right:60%
)

if [ -n "$target" ]; then
  tmux switch-client -t "$(echo "$target" | cut -d' ' -f1)"
fi
