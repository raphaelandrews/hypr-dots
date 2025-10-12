# Disable instant prompt for clean fastfetch display
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Run Fastfetch once per session
if [[ -z $FASTFETCH_RUN ]]; then
  export FASTFETCH_RUN=1
  fastfetch
fi