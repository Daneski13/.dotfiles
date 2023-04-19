# File contains git related aliases and functions

# Rebase the last given number of commits
function rebase() {
    git rebase -i HEAD~$1
}

# Git
alias g="git"

# Pull
alias gpl="git pull --rebase"

# Clone
alias gcl="git clone --recursive"

# Add
alias ga="git add"
alias gaa="git add --all"
# Commit
alias gc="git commit"
# Push
alias gp="git push"

# Submodules update
alias gsu="git submodule update"

# Switch
alias gsw="git switch"
# Switch to new branch
alias gswn="git switch -c"

# Tag
alias gt="git tag -s"
# Tag list
alias gtl="git tag | sort -V"
