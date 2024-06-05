#!/bin/zsh
# alias by NObodyGX

alias G="git clone --depth=1 "
alias upgrade="yay -Syyu --noconfirm"
alias ca="conda activate "
alias ysy="yay"
alias yays="yay -Ss "
alias yayr="yay -R "
alias yayq="yay -Q | grep "
alias files="nautilus "
alias kk="du -sh *"

function nvim() {
  nohup gnome-text-editor $1 >/dev/null 2>&1 &
}


function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

