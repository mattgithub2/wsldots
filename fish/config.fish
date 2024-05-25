if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g -x fish_greeting ''
end

################
#   ALIASES    #
################
# goes to pythonProjects directory
alias py="cd /mnt/c/Users/mrpiz/PycharmProjects/pythonProject"
# shortens fish config
alias config="vim .config/fish/config.fish"
# change python3 to run
alias run="python3"
# package upgrades
alias update="sudo apt update && sudo apt upgrade"
# Need to use appimage because I cant update package past 0.6.1 
alias nvim='~/nvim.appimage'
# better cat
alias bat='batcat'
# continue download
 alias wget="wget -c"
#add new fonts
alias update-fc="sudo fc-cache -fv"

# USER PATHS
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/Applications $fish_user_paths $HOME $HOME/.scripts

# Fetchmaster
alias fmaster="~/.scripts/fetch-master/fm6000 -f ~/.scripts/fetch-master/astronaut.txt -c blue"
fmaster
alias c='clear;fmaster'
