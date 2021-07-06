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
set -g status-style "fg=white, bg=black"

# color24
# #f5871f Orange
# #C0A7C6 Lavendar
# #81a2be blue

# Left side of status bar
# set -g status-left "#[fg=colour236,bg=colour24] #S #[fg=colour114,bg=colour238,nobold,nounderscore,noitalics]"
# set -g status-left-bg colour233
# set -g status-left-fg colour243
# set -g status-left-length 40
set -g status-left "#[fg=black,bg=blue,bold] #S #[fg=blue,bg=black,nobold]"

# Right side of status bar
set -g status-right-style bg=colour233,fg=colour243
set -g status-right-length 150
set -g status-right "#[fg=brightblack,bg=black]#[fg=white,bg=brightblack,bold] %l:%M #[fg=cyan,bg=brightblack]#[fg=black,bg=cyan,bold] "

# Window status
# set -g window-status-format "  #I #W#F  "
set -g window-status-current-format "#[fg=black,bg=brightblack]#[fg=colour81,nobold] #I #W#F #[fg=brightblack,bg=black,nobold]"
set -g window-status-format "#[fg=black,bg=brightblack]#[fg=gray,nobold] #I #W#F #[fg=brightblack,bg=black,nobold]"

# Current window status
set -g window-status-current-style bg=colour24,fg=colour238

# Window with activity status
set -g window-status-activity-style fg=colour75,bg=colour238 # fg and bg are flipped here due to

# Window separator
set -g window-status-separator " "

# Window status alignment
set -g status-justify left

# Pane border
set -g pane-border-style bg=default,fg=black

# Active pane border
set -g pane-active-border-style bg=default,fg=brightblack

# Pane number indicator
set -g display-panes-colour colour233
set -g display-panes-active-colour colour245

# Clock mode
set -g clock-mode-colour colour24
set -g clock-mode-style 24

# Message
set -g message-style bg=brightblack,fg=cyan

# Command message
set -g message-command-style bg=brightblack,fg=cyan

# Mode
set -g mode-style bg=colour24,fg=colour232

