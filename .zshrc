zmodload zsh/zprof
# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/brunnerlivio/.zsh/completions:"* ]]; then export FPATH="/Users/brunnerlivio/.zsh/completions:$FPATH"; fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions sudo git-commit)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


source "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

if [ -f ~/.zsh_env ]; then
    . ~/.zsh_env
fi

export SPACESHIP_BATTERY_SHOW=false
source $HOME/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST


eval $(thefuck --alias)

bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

export PATH="$PATH:$HOME/bin"
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# Node

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
export COREPACK_ENABLE_STRICT=0

# pnpm
export PNPM_HOME="/Users/brunnerlivio/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# Deno
export DENO_INSTALL="/Users/brunnerlivio/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
. "/Users/brunnerlivio/.deno/env"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Java
export PATH="$HOME/workspace/FHNW/webec/selenium-java-4.21.0:$PATH"
removeFromPath () {
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}

export PATH="$PATH:$HOME/Applications/apache-tomcat-11.0.11/bin"

# PHP
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Python
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
#source /Users/brunnerlivio/.pyenv/shims/virtualenvwrapper.sh

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# TSP Web
export TSP_WEB_TS_BIN=ts

# ZPlug
source ~/.zplug/init.zsh
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug load

# Progress Bar
export PB_PROFILE=rnw-tp-prod

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

# SSH
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
 eval `ssh-agent`
 ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# Add any commands which depend on conda here
lazy_conda_aliases=('python' 'conda')

load_conda() {
  for lazy_conda_alias in $lazy_conda_aliases
  do
    unalias $lazy_conda_alias
  done

  __conda_prefix="$HOME/.miniconda3" # Set your conda Location

  # >>> conda initialize >>>
  __conda_setup="$("$__conda_prefix/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "$__conda_prefix/etc/profile.d/conda.sh" ]; then
          . "$__conda_prefix/etc/profile.d/conda.sh"
      else
          export PATH="$__conda_prefix/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<

  unset __conda_prefix
  unfunction load_conda
}

for lazy_conda_alias in $lazy_conda_aliases
do
  alias $lazy_conda_alias="load_conda && $lazy_conda_alias"
done
# <<< conda initialize <<<

[ -f "/Users/brunnerlivio/.ghcup/env" ] && . "/Users/brunnerlivio/.ghcup/env" # ghcup-env

. "$HOME/.local/bin/env"


setjdk 21

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/brunnerlivio/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/brunnerlivio/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/brunnerlivio/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/brunnerlivio/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

zprof
