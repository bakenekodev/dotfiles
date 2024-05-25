# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$HOME/homebrew/bin:$PATH
export PATH="/Users/mariusbitca/.asdf/shims:$PATH"
export PATH=/Users/mariusbitca/.local/bin:/Users/mariusbitca/.cargo/bin:$HOME/homebrew/bin:$PATH
export PATH="/Users/mariusbitca/homebrew/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export PATH="/Users/mariusbitca/homebrew/Cellar/postgresql@10/10.22_6/bin:$HOME/homebrew/Cellar/libpq/14.5/include/:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$$HOME/.cargo/bin:$PATH"
export PATH="/Users/mariusbitca/.gem/ruby/3.0.0/bin:$PATH"
export PATH="/Users/mariusbitca/homebrew/opt/openssl@3/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_CELLAR="$HOME/homebrew/Cellar"
export HOMEBREW_PREFIX="$HOME/homebrew"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
export FREEDESKTOP_MIME_TYPES_PATH="$HOME/Documents/freedektop.org.xml"
export GOPATH="$HOME/go"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/Users/mariusbitca/homebrew/opt/nvm/nvm.sh" ] && \. "/Users/mariusbitca/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/Users/mariusbitca/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/Users/mariusbitca/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ruby
export RUBYOPT="-W0"
# export COVERAGE=true
export FEATURE=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="refined"
# ZSH_THEME="af-magic" # set by `omz`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  rails
  autojump
  aliases
  extract
  fzf-tab
  asdf
)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to deftine aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export EDITOR='nvim'
alias rs='rails s'
alias rc='rails c'
alias rmt='rails db:migrate RAILS_ENV=test'
alias rmd='rails db:migrate RAILS_ENV=development'
alias rma='rmd && rmt'
alias rback='rails db:rollback RAILS_ENV=development && RAILS_ENV=test rails db:rollback'
alias gc='git checkout'
alias gm="git merge"
alias cat='bat'
alias sk='bundle exec sidekiq'
alias be='bundle exec'
alias gs='git stash -u'
alias gsp='git stash pop'
alias gsl='git stash list'
alias ll='exa -l --icons'
alias ls='exa --icons'
alias la='exa -la --icons'
alias sjs='nvim $(bundle info saltjs --path)'
alias scmn='nvim $(bundle info salt-common --path)'
alias bi='brew install'
alias zrc='nvim ~/.zshrc'
alias gmm='gcmsg'
alias sz='source ~/.zshrc'
alias kitt='nvim ~/.config/kitty/kitty.conf'
alias buck='kitty --session /Users/mariusbitca/Documents/bucket.session'
alias ra='rubocop -a '
alias b='btop'
alias t='RUBYOPT="-W0" FEATURE=true bundle exec rspec '
alias dbr='git branch -D '
alias push='sup && ggpush'
alias lint="time node_modules/.bin/coffeelint app/assets/javascripts && time node_modules/@coffeelint/cli/bin/coffeelint app/frontend"
alias st="HEADLESS=false at"
alias at="DRIVER=apparition t"
alias cop="zsh ~/Documents/sh-scripts/rubocop.sh"
alias kbuck="lsof -t -i tcp:5000 | xargs kill"
alias kth="lsof -t -i tcp:6000 | xargs kill"
alias ks="lsof -t -i tcp:4321 | xargs kill"
alias pmrs="se deploy --create-mr bucket production"
alias dst="se deploy bucket s"
alias dpr="se deploy bucket p"
alias n="nvim"
alias g="lazygit"
alias dots="nvim ~/dotfiles"

function gsa() {
  git stash apply stash@{"$1"}
}

function sw() {
  branch=`git branch --show`
  if [ ${branch: -1} = "S" ]; then
    branch=${branch:0:-2}
  else
    branch="${branch}-S"
  fi
  gc ${branch}
}

# SE integration
[ -f ~/.se-zsh.sh ] && source ~/.se-zsh.sh

function spush() {
  branch=`git branch --show`
  gc ${branch}-S
  sup
  gm ${branch}
  ggpush
}

ulimit -n 4096

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
