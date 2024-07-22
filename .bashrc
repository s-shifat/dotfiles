#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -Alh' # show hidden files
PS1='[\u@\h \W]\$ '

# Alias for going to notes
alias n="cd ~/notes/"
alias p="cd ~/projects/"
alias d="cd ~/Documents/"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

 # set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi

# PATH Example
export PATH="$HOME/.local/bin:\
$HOME/.cargo/bin:\
$HOME/.npm-global/bin:\
$HOME/.yarn/bin:\
$HOME/.config/yarn/global/node_modules/.bin:\
$HOME/.local/share/gem/ruby/3.0.0/bin:\
$HOME/.cargo/env:\
/root/.local/share/gem/ruby/3.0.0/bin:\
/usr/local/bin:\
/usr/share/nvm/init-nvm.sh:\
/opt/rocm/bin:\
$PATH"

source ~/fzf_rc.sh
