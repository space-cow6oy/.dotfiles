# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# HISTFILE=$HOME/.zhistory


SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias ls="eza --icons=always"
eval "$(zoxide init zsh)"
alias cd="z"

alias t='tmux'
alias lg='lazygit'

alias leet='XDG_CONFIG_HOME=~/.config/nvleet/ nvim leetcode.nvim'
alias nv='XDG_CONFIG_HOME=~/.config/nvr/ nvim'
alias nvp='XDG_CONFIG_HOME=~/.config/nvp/ nvim'
alias snv='sudo nvim'
alias cddots='cd ~/.dotfiles'
alias nvconf='cd ~/.dotfiles/nvim && nvim'
alias cdp='cd ~/projects'



# completion using arrow keys (based on history)
bindkey '^[[h' history-search-backward
bindkey '^[[l' history-search-forward

alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s 0 && \
        tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t 0 && \
        tmux attach || tmux attach'



[ ! -f ~/.giga_creds ] || source ~/.giga_creds
[ ! -f ~/.gigairc ] && source ~/.gigarc
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH="$HOME/bin:$PATH"
