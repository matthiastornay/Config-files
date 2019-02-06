cd ~ 

min = 1
max = 6
number = $[($RANDOM % ($[$max - $min] + 1)) + $min]
if [ $number = 1 ]
then
	cat .background_1.txt
elif [ $number = 2 ]
then	
	cat .background_2.txt
elif [ $number = 3 ]
then
	cat .background_3.txt
elif [ $number = 4 ]
then
	cat .background_4.txt
elif [ $number = 5 ]
then
	cat .background_5.txt
else
	cat .background_6.txt
fi

# cat .background_1.txt
# cat .background_2.txt
# cat .background_3.txt
# cat .background_4.txt
# cat .background_5.txt
# cat .background_6.txt

case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias irc='irssi -c irc.smoothirc.net -p 6667'
alias lstree='tree -shL 1'
alias T='cat /sys/class/thermal/thermal_zone0/temp'
alias ls='ls -a --color'
alias low_light='echo 250 > /sys/class/backlight/nv_backlight/brightness'
alias medium_light='echo 500 > /sys/class/backlight/nv_backlight/brightness'
alias high_light='echo 1000 > /sys/class/backlight/nv_backlight/brightness'
alias eagle='cd ~/Bureau/eagle-9.1.3 && ./eagle'
alias unity='cd ~/Bureau/Unity-2017.3.0b1/Editor && ./Unity'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Custom bash prompt generated via kirsle.net/wizards/ps1.html
# User prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
# Super-user prompt
# export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 1)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 1)\]\h \[$(tput setaf 1)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 1)\]\\$ \[$(tput sgr0)\]"
