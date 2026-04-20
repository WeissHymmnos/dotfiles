# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR="${EDITOR:-code}"
export PYTHONWARNINGS="${PYTHONWARNINGS:-ignore}"
export NVD_BACKEND="${NVD_BACKEND:-direct}"

if [[ ":$PATH:" != *":$HOME/.lmstudio/bin:"* ]]; then
  export PATH="$PATH:$HOME/.lmstudio/bin"
fi

[[ -r "$HOME/.config/.dart-cli-completion/zsh-config.zsh" ]] && source "$HOME/.config/.dart-cli-completion/zsh-config.zsh"

local_zsh_dir="${XDG_CONFIG_HOME:-$HOME/.config}/local/zsh"
[[ -r "$local_zsh_dir/local.zsh" ]] && source "$local_zsh_dir/local.zsh"
[[ -r "$local_zsh_dir/secrets.zsh" ]] && source "$local_zsh_dir/secrets.zsh"
unset local_zsh_dir

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
