#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /etc/profile

setPS1()
{
  HIKOTO=$(node -p "(`curl -ks https://api.hitokoto.us:214/rand?charset=utf-8`).hitokoto")
  PS1='⌊\u⚛\H⌋$HIKOTO\nSo, \W, as I pray\$'
}

setZHLocale()
{
  LANG=zh_CN.UTF-8
}

gitDebugOn()
{
  # for  git truobleshooting
  export GIT_TRACE_PACKET=1
  export GIT_TRACE=1
  export GIT_CURL_VERBOSE=1
}

gitDebugOff()
{
  export GIT_TRACE_PACKET=0
  export GIT_TRACE=0
  export GIT_CURL_VERBOSE=0
}

node_prof_process() {
  for log in $(ls isolate*.log); do
    node --prof-process $log > ${log%.log}.txt
  done
}

#default editor
export VISUAL="vim"

#node.js module path
export NODE_PATH=/home/frantic/npm-global/lib/node_modules/:$NODE_PATH:/usr/lib/node_modules

export PATH=~/npm-global/bin/:~/.gem/ruby/2.2.0/bin/:/root/.composer/vendor/bin:~/code/using/:$PATH

export GIT_ASKPASS="/usr/bin/ksshaskpass"
export SSH_ASKPASS="/usr/bin/ksshaskpass"

# env for armitage
export MSF_DATABASE_CONFIG="~/.msf4/database.yml"
# start msfrpcd for armitage
export msfrpcdes="msfrpcd -f -U msf -P msf -S -p 55559"

# FIX phantomjs crash issue
# https://github.com/ariya/phantomjs/issues/14061
alias phantomjs="QT_QPA_PLATFORM='' phantomjs"

# task name auto completion for gulp
# toooo slow, disabled
#eval "$(gulp --completion=bash)"

alias ls='ls --color=auto'
alias tts='text-to-speech zh-CN'
alias ttse='text-to-speech'
alias ttsj='text-to-speech ja'
alias prpr='proxychains'

# simpler python http server
alias pyserv='python -m http.server'

# start hefur bittorrent tracker
alias tracker='hefurd -ipv6 -log-color -log-level info -udp-port 6969 -http-port 6969 -https-port 6970'

alias curl-prpr="alias curl=\"curl -x localhost:8388\""
alias curl-unprpr="unalias curl"

# update package.json's version without git command
alias nv1="npm --froce --no-git-tag-version version major && git add --all"
alias nv2="npm --froce --no-git-tag-version version minor && git add --all"
alias nv3="npm --froce --no-git-tag-version version patch && git add --all"

# aria2c alias
alias aria2cc="aria2c --conf-path=/home/frantic/bkped/aria2c.conf "

# extract non-utf8 archive, like gbk..
alias xagbk="env LANG=C 7z x "

# rename gbk stuff from archive
alias mvgbk="convmv -f gbk -t utf8 "

alias such=git
alias very=git
alias wow='git status'

# enable autocd
shopt -s autocd

setPS1
