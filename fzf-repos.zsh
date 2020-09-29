# vim: ft=sh:
################################################################################
#    Author: Wenxuan                                                           #
#     Email: wenxuangm@gmail.com                                               #
#   Created: 2019-01-21 17:31                                                  #
################################################################################

# $1: repos root
# $2: repos level
function fzf-repos::list() {
    local root=$1
    local level="${2:-1}"

    root="$(cd "$root" && pwd)"
    find "$root" -maxdepth "$level" -mindepth "$level" -type d | sed "s#$root/##g"
}

# $1: repos root
# $2: repos level
function repos-cd() { cd "$1/$(fzf-repos::list "$1" "${2:-1}" | fzf)" && pwd; }

function zcd() { repos-cd ~/.zplug/repos 2; }
function vcd() { repos-cd ~/.vim/plugged;  }
function tcd() { repos-cd ~/.tmux/plugins; }
