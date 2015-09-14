#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


setPS1  ()
{
    HIKOTO=$(node -p "(`curl -ks https://api.hitokoto.us:214/rand?charset=utf-8`).hitokoto")
  PS1='⌊\u⚛\H⌋$HIKOTO\nSo, \W, as I pray\$'
}

#default editor
export VISUAL="vim"

#node.js module path
NODE_PATH=$NODE_PATH:/usr/lib/node_modules

# task name auto completion for gulp
eval "$(gulp --completion=bash)"

alias ls='ls --color=auto'
alias tts='text-to-speech zh-CN'
alias ttse='text-to-speech'
alias ttsj='text-to-speech ja'

alias curl-proxy="alias curl=\"curl -x localhost:8388\""
alias curl-unproxy="unalias curl"

# update package.json's version without git commit or tagging
alias nv1="npm --froce --no-git-tag-version version major && git add --all"
alias nv2="npm --froce --no-git-tag-version version minor && git add --all"
alias nv3="npm --froce --no-git-tag-version version patch && git add --all"

setPS1
