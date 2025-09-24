#!/bin/bash
PROJECT_REPO=$1

if [ -n "$TMUX" ]; then
  # Already inside tmux
  tmux split-window -v -p 20 -c "$PROJECT_REPO"
  tmux select-pane -t 0
  tmux send-keys "cd $PROJECT_REPO" C-m
  tmux send-keys "clear" C-m
  tmux send-keys "nvim" C-m
else
  # Not in tmux, start a new session
  tmux new-session -d -c "$PROJECT_REPO"
  tmux split-window -v -p 20 -c "$PROJECT_REPO"
  tmux select-pane -t 0
  tmux send-keys "cd $PROJECT_REPO" C-m
  tmux attach
fi
