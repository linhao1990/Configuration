#~/.bash_aliases
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    # Make grep colorful and skip .svn
    alias grep='grep --color=auto --exclude-dir=".svn"'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ls='ls -G'
alias ll='ls -alF -h -G'
#alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'

# awesome!  CD AND LA. I never use 'cd' anymore...
function cl(){ cd "$@" && la; }

## Edited By Hao Lin
alias rm!="/bin/rm -vi"

alias rm='~/bin/trashit'
alias lrm='ls ~/.Trash'
alias trm='/bin/rm  -rf ~/.Trash/*'

alias c=clear

alias skim="(head -5; tail -5) <"

# Make it no matter what
alias mkdir="mkdir -p"

# tac
tac () {
    awk '{ last = NR; line[last] = $0; } END { for (i = last; i > 0; i--) { print line[i]; } }'
}
