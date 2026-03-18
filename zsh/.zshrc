# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
# 先取消 TAB 的默认绑定（expand-or-complete），避免冲突
#bindkey -r '^I'

# 再绑定 TAB（^I）为 zsh-autosuggestions 的“接受建议”
bindkey '^I' autosuggest-accept



source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export NODE_OPTIONS=--max-old-space-size=4096

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
alias web3="source ~/web3/bin/activate"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/weisshymmnos/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/weisshymmnos/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/weisshymmnos/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/weisshymmnos/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export LLM_KEY="sk-rublDF9Ea2tWLlSk4rjfvniS6Z9zJfqUqkbBnp10GW0PLCid"
export ALPHAACANTAGE_API_KEY="8E02Z1WQ143JKT7A"
 
export PATH="/Applications/MATLAB_R2025b.app/bin:$PATH"


# >>> Added by Spyder >>>
alias uninstall-spyder=/Users/weisshymmnos/Library/spyder-6/uninstall-spyder.sh
# <<< Added by Spyder <<<
#
export PATH="/usr/local/bin:$PATH"
