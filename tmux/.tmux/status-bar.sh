# TODO: Custom status bar configuration based somewhat on erikw/tmux-powerline

# Make status bar transparent
tmux set -g status-style "fg=default,bg=default,nobold,noitalics,nounderscore"
# Remove gap between window names in status line
tmux set -g window-status-separator ""

# Separators
SEPARATOR_LEFT=""
SEPARATOR_LEFT_THIN=""
SEPARATOR_RIGHT=""
SEPARATOR_RIGHT_THIN=""
SEPARATOR_NONE="ㅤ"

# window status style
WINDOW_STATUS_STYLE=(
	"fg=red,bg=white"
)
tmux set -g window-status-style "$(printf '%s' "${TMUX_POWERLINE_WINDOW_STATUS_STYLE[@]}")"

echo $(tput setab 0)

# Currently active window status
WINDOW_STATUS_CURRENT_FORMAT=(
	"#[fg=black,bg=white]"
	"$SEPARATOR_RIGHT"
	" #I "
	"$SEPARATOR_RIGHT_THIN"
	" #W "
	"#[fg=terminal,bg=terminal]"
	"$SEPARATOR_RIGHT"
)
tmux set-option -g window-status-current-format "$(printf '%s' "${WINDOW_STATUS_CURRENT_FORMAT[@]}")"

# Inactive window status
WINDOW_STATUS_FORMAT=(
	"#[fg=default,bg=black]"
	"$SEPARATOR_RIGHT"
	" #I "
	"$SEPARATOR_RIGHT_THIN"
	" #W "
)
tmux set-option -g window-status-format "$(printf '%s' "${WINDOW_STATUS_FORMAT[@]}")"
