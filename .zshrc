# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded
ZSH_THEME="agnoster"

DEFAULT_USER="loganengstrom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-

echo export PATH='/usr/local/bin:$PATH' >> ~/.bash_profile

alias picoc='/usr/local/Cellar/picoc/2.1/bin/picoc -i'
alias ytmp3='youtube-dl --extract-audio --audio-quality 0 --audio-format "mp3" --output "%(title)s.%(ext)s"'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gacm='git commit -a -m '
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias hist="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short | cat"
alias got='git '
alias get='git '
alias st="open -a \"Sublime Text.app\""
alias hb9="ssh engstrom@hb9.csail.mit.edu"
export ANDROID_HOME=/usr/local/opt/android-sdk
PATH=$PATH\:/Android/ant/
PATH=$PATH\:/Android/platform-tools/
PATH=$PATH\:/Android/tools/
fpath=( ~/.zfunc "${fpath[@]}" )

#cd /nfs/BaRC_Public/engstrom/

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting osx brew dirhistory python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export NODE_PATH=/usr/lib/node_modules

cd ~/projects/
export PATH=${PATH}:/Development/adt-bundle/sdk/platform-tools:/Development/adt-bundle/sdk/tools:/Development/apache-ant/bin
alias bbb="ssh ubuntu@192.168.7.2"
alias vw=/Users/loganengstrom/Documents/projects/vowpal_wabbit/vowpalwabbit/vw
echo export PATH='/usr/local/bin:$PATH' >> ~/.bash_profile
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
alias cling=/usr/local/cling-MacOSX-10.9-dec5717d4c/bin/cling
