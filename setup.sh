#!/usr/bin/bash

function mklink () {
	ln -nfs ./$1/ ~/.config/$1
}


# alcritty
mklink "alacritty"

# rofi
mklink "rofi"

# ranger
mklink "ranger"
