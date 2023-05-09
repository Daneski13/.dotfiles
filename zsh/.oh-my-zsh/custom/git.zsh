# File contains git related aliases and functions

# Git
alias g="git"

# Fetch
alias gf="git fetch"
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

# Diff
alias gd="git diff"
# Diff files
alias gdf="git diff --name-only"
# Diff staged
alias gds="git diff --cached"
# Diff remote
alias gdr="git diff @{u}"

# Status
alias gstat="git status"

# Log
alias gl="git log --graph --pretty=oneline --abbrev-commit --decorate"

# Submodules update
alias gsu="git submodule update"

# Banches
alias gb="git branch"
# Switch
alias gsw="git switch"
# Switch to new branch
alias gswn="git switch -c"

# Tag
alias gt="git tag -s"
# Tag list
alias gtl="git tag | sort -V"

# Rebase the last given number of commits
function g_rebase() {
    git rebase -i HEAD~$1
}

# squash a range of commits
function g_squash_all() {
    # get the first commit
    local first_commit=$(git rev-list --max-parents=0 HEAD)

    # soft reset to the first commit
    git reset --soft $first_commit
}
