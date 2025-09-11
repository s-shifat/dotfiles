###
# https://fishshell.com/docs/current/index.html
# https://github.com/jorgebucaran/cookbook.fish

# themes
# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md

# Plugins
# https://github.com/jethrokuan/fzf
# https://github.com/IlanCosman/tide.git - fisher install IlanCosman/tide@v5
# https://github.com/jhillyerd/plugin-git

# tools
# https://github.com/jorgebucaran/fisher
# https://github.com/oh-my-fish/oh-my-fish
# https://github.com/danhper/fundle

#set VIRTUAL_ENV_DISABLE_PROMPT "1"

set -g fish_greeting

if status is-interactive
    starship init fish | source
end

#list
# alias ls="ls --color=auto"
# alias la="ls -a"
# alias ll="ls -alFh"
alias l="ls"
alias l.="ls -A | egrep '^\.'"

# Alias for going to notes
alias n="cd ~/notes/"
alias p="cd ~/projects/"
alias d="cd ~/Documents/"
alias ds="source ~/venvs/venvDS/bin/activate.fish"



if type -q exa
    alias ls="exa"
    alias xls="exa -a --icons --color=always --group-directories-first"
    alias xll="exa -lag --icons --color=always --group-directories-first --octal-permissions"
end

#fix obvious typo's
alias cd..="cd .."
alias pdw="pwd"
alias udpate="sudo pacman -Syyu"
alias upate="sudo pacman -Syyu"
alias updte="sudo pacman -Syyu"
alias updqte="sudo pacman -Syyu"
alias upqll="paru -Syu --noconfirm"
alias upal="paru -Syu --noconfirm"

## Colorize the grep command output for ease of use (good for log files)##
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Color output of ip
alias ip="ip -color"

#readable output
alias df="df -h"
# List Directory
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias ll="ls -al"

function cd
    builtin cd $argv; and ls
end

# Handy change dir shortcuts
# abbr .. 'cd ..'
# abbr 'cd..' 'cd ..'
# abbr ... 'cd ../..'
# abbr .3 'cd ../../..'
# abbr .4 'cd ../../../..'
# abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
# abbr mkdir 'mkdir -p'

# User paths
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/Applications $HOME/my-scripts $fish_user_paths $HOME/.config/yarn/global/node_modules/.bin /opt/rocm/bin/

# Sets the terminal type for proper colors
set TERM "xterm-256color"


# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0
set -x FZF_DEFAULT_OPTS "--color=16,header:13,info:5,pointer:3,marker:9,spinner:1,prompt:5,fg:7,hl:14,fg+:3,hl+:9 --inline-info --tiebreak=end,length --bind=shift-tab:toggle-down,tab:toggle-up"
# "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -g theme_nerd_fonts yes

if type -q bat
    alias cat="bat --paging=never"
end

# reload fish config
function reload
    exec fish
    set -l config (status -f)
    echo "reloading: $config"
end


function ex --description "Extract bundled & compressed files"
    if test -f "$argv[1]"
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z $argv[1]
            case '*.deb'
                ar $argv[1]
            case '*.tar.xz'
                tar xf $argv[1]
            case '*.tar.zst'
                tar xf $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted via ex"
        end
   else
       echo "'$argv[1]' is not a valid file"
   end
end



# reporting tools - install when not installed
# Only run fastfetch in interactive shells
if status is-interactive
    fastfetch
end

# fastfetch
# neofetch
#screenfetch
#alsi
#paleofetch
#fetch
#hfetch
#sfetch
#ufetch
#ufetch-arco
#pfetch
#sysinfo
#sysinfo-retro
#cpufetch
#colorscript random

if type -q exa
  alias ls "exa --icons"
  alias lla "exa -l -g --icons"
end

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'
source ~/.profile


# Add Nix daemon environment
if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    # Ensure nix profile bin is in PATH
    set -gx PATH /nix/var/nix/profiles/default/bin $PATH

    # (Optional, for man pages and completion)
    set -gx MANPATH /nix/var/nix/profiles/default/share/man $MANPATH
    set -gx INFOPATH /nix/var/nix/profiles/default/share/info $INFOPATH
end

