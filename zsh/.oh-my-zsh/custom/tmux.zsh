# File contains tmux related stuff

# tmux
alias tm="tmux"

# kill all, exit all sessions
alias tmka="tmux kill-server"

# resource tmux config
function tmf5() {
	tmux source-file ~/.tmux.conf
}

# === Sessions ===
# sessionizer/new session
function tmns() {
	tmux-sessionizer $1
}

# kill session
alias tmks="tmux kill-session"

# === Windows ===
# new window
alias tmnw="tmux new-window"
