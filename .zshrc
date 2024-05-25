# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit snippet OMZP::rails

autoload -U compinit && compinit

zinit cdreplay -q
 
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

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_CELLAR="$HOME/homebrew/Cellar"
export HOMEBREW_PREFIX="$HOME/homebrew"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
export FREEDESKTOP_MIME_TYPES_PATH="$HOME/Documents/freedektop.org.xml"
export GOPATH="$HOME/go"
export RUBYOPT="-W0"
# export COVERAGE=true
export FEATURE=true

export EDITOR='nvim'

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/Users/mariusbitca/homebrew/opt/nvm/nvm.sh" ] && \. "/Users/mariusbitca/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/Users/mariusbitca/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/Users/mariusbitca/homebrew/opt/nvm/etc/bash_completion.d/nvm"

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
# setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# bindkey "^[[A" up-line-or-beginning-search
# bindkey "^[[B" down-line-or-beginning-search
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

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
alias ll='eza -l --icons'
alias ls='eza --icons'
alias la='eza -la --icons'
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

eval "$(fzf --zsh)"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
