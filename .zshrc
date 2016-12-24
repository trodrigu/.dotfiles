# Path to your oh-my-zsh installation.
export ZSH=/Users/trodrigu/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
 #DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history frontend-search ruby)

# User configuration

# Install z
. "/Users/trodrigu/.oh-my-zsh/plugins/z/z.sh"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
#export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"
export PATH=$PATH:/usr/local/go/bin
export NVM_DIR=$(brew --prefix)/var/nvm
source $(brew --prefix nvm)/nvm.sh
export EDITOR=nvim
source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/apache-maven-3.3.3/bin:$PATH"
export PATH="/Library/Python/2.7/bin"
export GOPATH=$HOME/Code/golang
export PATH=/Library/Frameworks/Python.framework/Versions/3.3/bin:$PATH
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias f="open -a finder"
alias m="mvim"
alias tx="open -a /Applications/TeX/TeXShop.App"
alias gprune="git branch -r | awk '{print \$1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print \$1}' | xargs git branch -d"
alias ta="ctags --exclude=*.html --exclude=*.js --exclude=*.css --exclude=*.scss -R"

# Mactex path
eval `/usr/libexec/path_helper -s`

# Sublime alias
alias sub="subl"

# alias bundle exec
alias be="bundle exec"

# Gems path
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# Rbenv path, make sure this is below gems path
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - --no-rehash zsh)"

# Hub path
eval "$(hub alias -s)"

# Set environment variable for true colour in Neovim
#alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
#alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias nv='nvim'

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
   sed s/^..//) 2> /dev/null'

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# Iterm2 shell integration
source ~/.iterm2_shell_integration.`basename $SHELL`

# Docker
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/trodrigu/.docker/machine/machines/dev"
export DOCKER_MACHINE_NAME="dev"
# Run this command to configure your shell:
# eval "$(docker-machine env dev)"

# Merge conflicts
#alias fix='git diff --name-only | uniq | xargs $EDITOR'
alias fix='git mergetool --tool=gvimdiff'

[ -s "/Users/trodrigu/.dnx/dnvm/dnvm.sh" ] && . "/Users/trodrigu/.dnx/dnvm/dnvm.sh" # Load dnvm

# added by travis gem
[ -f /Users/trodrigu/.travis/travis.sh ] && source /Users/trodrigu/.travis/travis.sh

source ~/Code/release_scripts/release_script.sh
source ~/Code/release_scripts/release_script_2.sh

alias python=/usr/local/bin/python3
alias ducks='du -cks * | sort -rn | head'

# git recent
grct() {
  git reflog -n500 --pretty='%cr|%gs' --grep-reflog='checkout: moving' HEAD | {
    seen=":"
    git_dir="$(git rev-parse --git-dir)"
    while read line; do
      date="${line%%|*}"
      branch="${line##* }"
      if ! [[ $seen == *:"${branch}":* ]]; then
        seen="${seen}${branch}:"
        if [ -f "${git_dir}/refs/heads/${branch}" ]; then
          printf "%s\t%s\n" "$date" "$branch"
        fi
      fi
    done
  }
}

alias cn='ccat config/customer_name.yml'
alias cnc='nv config/customer_name.yml'

alias gn='elixir git_next.exs'
alias gp='elixir git_next.exs --gitprevious'
