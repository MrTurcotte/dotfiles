#! /bin/bash

PS1="\n$PS1"

PATH="/home/dave/.local/bin:/home/dave/.bin:/home/dave/Programs/android-studio/bin:$PATH"

alias tolga-batt='clear && echo "Battery: $(acpi -b | awk '\''{print $3}'\'')" && echo '' && echo "Battery Percentage: $(acpi -b | awk '\''{print $4}'\'')" && echo '' && echo "Remaining Time: $(acpi -b | awk '\''{print $5,$6,$7 == "until" ? "until fully charged" : $7}'\'')"'
alias tolga-origbatt="clear && echo Status: && acpi -b | gawk -F ',' -P '{ print $1 }' | gawk -P '{ print $3 }' && echo '' && echo Current Battery: && acpi -b | gawk -F ',' -P '{ print $2 }' | gawk -P '{ print $1 }' && echo '' && echo Remaining Time: && acpi -b | gawk -P '{ print $5 }'"

alias pacman='sudo pacman'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
# alias ls='exa'
alias rb='sudo nixos-rebuild'
alias list-generations='sudo nix-env --list-generations --profile /nix/var/nix/profiles/system'
alias configure='sudo nano /etc/nixos/configuration.nix'
alias addpkgs='sudo nano /etc/nixos/packages/default.nix'
alias update='sudo nix-channel --update'
alias upgrade='sudo nixos-rebuild switch --upgrade'
alias nixpkgs='nix search nixpkgs'
alias garbage='sudo nix-collect-garbage -d'
# alias beeper='devour appimage-run Applications/beeper-3.65.19.AppImage'

alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias personal='git --git-dir=$HOME/.personal/ --work-tree=$HOME'

alias stormwind='ssh -i .ssh/stormwindKeep dave@192.168.2.44'

alias witCopy='wit COPY --split'

#killall() {
#	kill $(pidof $1)
#}

#cat ~/neofetch.file
#neofetch


PS1='[\u@\h \w] $ '
PS1='\[[37m\][\u@\[[36m\]\h \[[37m\]\w] $ '
PS1='\[[37m\][\u@\h \[[36m\]\w\[[37m\]] $ '
