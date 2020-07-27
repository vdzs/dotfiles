# History control
# don't use duplicate lines or lines starting with space
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
# append to the history file instead of overwrite
shopt -s histappend

# Aliases
alias clip='xclip -sel c'
alias cp='cp -Rv'
alias ls='ls --color=auto -ACF'
alias ll='ls --color=auto -alF'
alias grep='grep --color=auto'
alias grepw='grep --color=auto -Hrnwi'
alias mkdir='mkdir -pv'
alias mv='mv -v'
alias tree="tree -aI 'test*|node_modules|.git'"
alias weather='curl wttr.in/?0'
alias wget='wget -c'

git config --global alias.gcom commit
git config --global alias.gsup status
git config --global alias.goto checkout
alias gcom='git commit'
alias gsup='git status'
alias goto='git checkout'
alias branches='git branch -v'
alias firewood='for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done'

alias pip='pip3'
alias pym='python3 manage.py'
alias mkenv='python3 -m venv env'
alias startenv='source env/bin/activate && which python3'
alias stopenv='deactivate'

# Use programs without a root-equivalent group
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'

# Show contents of dir after action
function cd () {
    builtin cd "$1"
    ls -ACF
}

# Golang install or upgrade
function getgolang () {
    sudo rm -rf /usr/local/go
    wget -q -P tmp/ https://dl.google.com/go/go"$@".linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf tmp/go"$@".linux-amd64.tar.gz
    rm -rf tmp/
    go version
}

# GHCLI install or upgrade
function getghcli () {
    wget -q -P tmp/ https://github.com/cli/cli/releases/download/v"$@"/gh_"$@"_linux_amd64.deb
    cd tmp/ && sudo dpkg -i gh_"$@"_linux_amd64.deb
    cd .. && rm -rf tmp/
    gh --version
}

# Markdown link check in a folder, recursive
function mlc () {
    find $1 -name \*.md -exec markdown-link-check -p {} \;
}

# Go
export PATH=$PATH:/usr/local/bin:/usr/local/go/bin:~/.local/bin:$GOPATH/bin
export GOPATH=~/go

# Vim for life
export EDITOR=/usr/bin/vim

# Bash completion
source ~/.git-completion.bash

# Use powerline-shell prompt
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
