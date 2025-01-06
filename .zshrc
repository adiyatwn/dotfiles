# Enable Powerlevel10k instant prompt
# This must be the first thing to ensure no output before instant prompt initialization
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the environment variables
export VISUAL=nvim
export EDITOR=nvim
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export PATH=$PATH:/home/shiielty/.spicetify

# Add Deno completions to the search path
if [[ ":$FPATH:" != *":/home/shiielty/.zsh/completions:"* ]]; then
  export FPATH="/home/shiielty/.zsh/completions:$FPATH"
fi

# Path to oh-my-zsh installation
ZSH=/usr/share/oh-my-zsh/

# Path to Powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )

# Load custom plugins (ensure zsh-completions exists)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# Command not found handler (for package installation)
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

# Function to install a package (from AUR or official repos)
function in {
    local pkg="$1"
    if pacman -Si "$pkg" &>/dev/null ; then
        sudo pacman -S "$pkg"
    else 
        "$aurhelper" -S "$pkg"
    fi
}

# Helpful aliases
alias l='eza -lh --icons=auto'   # long list
alias ls='eza -1 --icons=auto'   # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'  # long list all
alias ld='eza -lhD --icons=auto'  # long list dirs
alias un='$aurhelper -Rns'        # uninstall package
alias up='$aurhelper -Syu'        # update system/package/aur
alias pl='$aurhelper -Qs'         # list installed package
alias pa='$aurhelper -Ss'         # list available package
alias pc='$aurhelper -Sc'         # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -'  # remove unused packages
alias vc='code --disable-gpu'     # GUI code editor
alias v='nvim'                    # nvim alias
alias vim='nvim'                  # vim alias (use nvim instead)
alias todoist='todoist-cli'       # Todoist CLI
alias mergeVideoAudio='$HOME/scripts/mergeVideoAudio.sh'  # video/audio merge
alias mergeVideoSubtitle='$HOME/scripts/mergeVideoSubtitle.sh'  # video/subtitle merge

# Key bindings (for custom actions)
bindkey -s '^f' '$HOME/scripts/tmux-sessionizer\n'
bindkey -s '^r' 'ranger\n'
bindkey -s '^n' 'vim $HOME/notes/quicknotes.md\n'

# Load Powerlevel10k settings if available
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source custom functions (ensure the file exists)
source "$HOME/scripts/todoist_functions_fzf.sh"

# Initialize completion system
compinit

# Initialize zoxide (ensure zoxide is installed)
eval "$(zoxide init --cmd cd zsh)"

# Source Deno environment (ensure the file exists)
. "/home/shiielty/.deno/env"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

export PATH="$PATH:/home/shiielty/personal/worldbanc/private/bin"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export PATH="$PATH:$HOME/go/bin"
