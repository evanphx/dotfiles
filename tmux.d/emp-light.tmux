##### THEME

# Powerline Double Cyan - Tmux Theme
# Created by Jim Myhrberg <contact@jimeh.me>.
#
# Inspired by vim-powerline: https://github.com/Lokaltog/powerline
#
# Requires terminal to be using a powerline compatible font, find one here:
# https://github.com/Lokaltog/powerline-fonts
#

# Status update interval
set -g status-interval 1

# Basic status bar colors
set -g status-bg colour238

# Left side of status bar
# set -g status-left "#[fg=colour236,bg=colour24] #S #[fg=colour114,bg=colour238,nobold,nounderscore,noitalics]"
# set -g status-left-bg colour233
# set -g status-left-fg colour243
set -g status-left-length 40
set -g status-left "#[fg=colour233,bg=colour24,bold] #S #[fg=colour24,bg=colour235,nobold]#[fg=colour240,bg=colour235] #I:#P #[fg=colour235,bg=colour238,nobold]"

# Right side of status bar
set -g status-right-length 150
set -g status-right-style fg=black,bold
set -g status-right "#[fg=colour235,bg=colour238]#[fg=colour240,bg=colour235] %l:%M #[fg=colour24,bg=colour235]#[fg=colour233,bg=colour24,bold] "

# Window status
setw -g window-style 'bg=#efefef'
setw -g window-active-style 'bg=#ffffff'

set-window-option -g window-status-style bg=default
set-window-option -g window-status-style fg=white
set-window-option -g window-status-style none

# set -g window-status-format "  #I #W#F  "
set-window-option -g window-status-format '#[fg=#6699cc,bg=colour235] #I #[fg=#999999,bg=#2d2d2d] #W #[default]'
set -g window-status-current-format "#[fg=colour238,bg=black]#[fg=colour81,nobold] #I #W#F #[fg=colour238,bg=black,nobold]"

# Current window status
# set -g window-status-current-style bg="#ffffff",fg="#3e999f"

set-window-option -g window-status-current-style none
set-window-option -g window-status-current-format '#[fg=#f99157,bg=#2d2d2d] #I #[fg=#cccccc,bg=#393939] #W #[default]'

# Window with activity status
setw -g window-status-activity-style 
setw -g window-status-activity-style 
set -g window-status-activity-style fg="#3e999f,"bg="#ffffff" # fg=colour75,bg=colour238 # fg and bg are flipped here due to

# Window separator
set -g window-status-separator " "

# Window status alignment
set -g status-justify centre

# Pane border
set -g pane-border-style bg=default,fg="#999999"

# Active pane border
setw -g pane-active-border-style ''
set -g pane-active-border-style fg="#f99157"

# Pane number indicator
set -g display-panes-colour colour233
set -g display-panes-active-colour colour245

# Clock mode
set -g clock-mode-colour "#4271ae"
set -g clock-mode-style 24

# Message
set -g message-style bg="#2d2d2d",fg="#cc99cc"

set -g mode-style bg="#ffffff",fg="#f5871f"

# Command message
set -g message-command-style bg="#3e999f",fg="#000000"

# Mode
set -g mode-style bg=colour24,fg=colour232

