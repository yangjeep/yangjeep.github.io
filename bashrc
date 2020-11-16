############################################
# Environment variables
############################################

#export PATH=$PATH:/opt/teambuilder/bin:/users/jiajyang/bin/:/router/bin:/usr/cisco/bin/:/usr/cisco/etc:/bin/:/usr/X11R6/bin:/usr/sbin:/sbin:/usr/bin:/usr/cisco/bin:/auto/mssbu-swtools/iox/bin

#export PATH=$PATH:/users/jiajyang/bin/:/router/bin:/usr/cisco/bin/:/usr/cisco/etc:/usr/sbin:/opt/teambuilder/bin:
#export PATH=/router/bin/:/usr/cisco/bin/:/usr/bin:/usr/sbin/:/users/jiajyang/bin/:/router/bin/:usr/cisco/etc:$PATH:
#export PS1='\s-\v\$'

#export PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
export PS1='\[\e[1;32m\][\u@\h]\$\[\e[0m\]'
#export PS1='[\s-\v:\!]\$\[\a\]'

#export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/cisco/bin:/router/bin:/users/jiajyang/bin:$PATH

#export PATH=/pkg/sbin/:/pkg/bin:/bin:/sbin:/usr/cisco/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/X11R6/bin:$PATH
#export PATH=/pkg/bin:/pkg/sbin:/bin:/sbin:/usr/cisco/bin:/usr/bin:/usr/sbin:/usr/local/bin/users/jiajyang/bin:/router/bin
#export LD_LIBRARY_PATH=/pkg/lib/:$LD_LIBRARY_PATH:$PATH

export PATH=$PATH:/pkg/bin:/pkg/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/cisco/bin:/users/jiajyang/bin:/router/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PATH

if [ -z "$IOX" ]; then
    export PATH=$PATH:/pkg/bin:/pkg/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/users/jiajyang/bin:/router/bin
    export LD_LIBRARY_PATH=/pkg/lib:$LD_LIBRARY_PATH:$PATH
#    export PATH=/pkg/bin/:/pkg/sbin:/bin:/sbin:/usr/cisco/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/X11R6/bin:$PATH
#    export LD_LIBRARY_PATH=/pkg/lib/:$LD_LIBRARY_PATH:$PATH
fi

# Firex
alias firex=/auto/firex/bin/firex
alias firex_precommit=/auto/firex/bin/precommit

#alias python='/usr/bin/python2.4'

#/auto/mssbu-swtools/iox/bin

#export IOX_VIEW_DIR=/nobackup/jiajyang/view_ci-531/

#export JAM_ADMIN_SERVERLIST=/auto/tftpboot-ottawa/jiajyang/ott-lb/teambuilder-hosts

export TERM=xterm-color

export CLICOLOR=1

dircolor=/users/jiajyang/.dir_colours
test -r $d && eval "$(dircolors $d)"

export LS_COLORS=$LS_COLORS
export LS_OPTIONS='--color=auto'

#if grep -q  "ott-ads-029" <<<$HOSTNAME;
#then
#    export TMPDIR=/nobackup/jiajyang/tmp
#fi
#if grep -q  "ott-tads-002" <<<$HOSTNAME;
#then
#    export TMPDIR=/nobackup/jiajyang/tmp
#fi
#if grep -q  "ott-pd-vs" <<<$HOSTNAME;
#then
#	source /auto/edatools/oicad/tools/vxr_user/vxr_latest/setup.sh
#fi
############################################
# Aliases
############################################

alias   tmux='/ws/jiajyang-ott/util/tmux/tmux'

alias pycharm='/ws/jiajyang-ott/pycharm-community-latest/bin/pycharm.sh'
alias vscode='/ws/jiajyang-ott/util/VSCode-linux-x64/code'

alias todo='/ws/jiajyang-ott/util/todo.txt-cli/todo.sh'

alias ls='ls $LS_OPTIONS'
## Scopes
alias   mkctags='ctags $(find . -name \*.[ch]);'
alias   scopei='rm -f cscope.files.in; find . \( -name "*.[ch]" -o -name "*.bgen" -o -name "*.cmd" -o -name "*.sch" -o -name "*.bag" \) -print | sed sm.\/mm | grep -v "obj-4k" | grep -v "obj-ppc" | grep -v "inc\/" > cscope.files.in;'
alias   scopen='cscope -b -q -i cscope.files.in | grep -v "copied";'
alias   scope_b='scopei scopen mkctags'
# make sure not to regenerate the database
# alias	cscope='cscope -d'

alias   my_ws_efr='/auto/mssbu-swtools/iox/bin/my_ws_efr'
alias   xr_commit='/auto/iox/bin/xr_commit'
alias   run_sa='/auto/ses/bin/run_sa'

## VIM
if [ -a /etc/redhat-release ] 
then
    if grep -q -i "release 5" /etc/redhat-release
    then
        export VIMRUNTIME=~/util/vim74/share/vim/vim74
        export VIM=~/util/vim74/bin/
        export EDITOR=~/util/vim74/bin/vim
        alias vim='$VIM/vim'
        export PATH=$PATH:/ws/jiajyang-ott/util/xsel/
        export PATH=$PATH:/ws/jiajyang-ott/util/xclip/
    fi
    if grep -q -i "release 7" /etc/redhat-release
    then
        alias eclipse='/ws/jiajyang-ott/eclipse/eclipse'
        alias git='/usr/cisco/bin/git'
        alias svn='/usr/cisco/bin/svn'
        export VIMRUNTIME='/ws/jiajyang-ott/util/vim/share/vim/vim82'
        export VIM='/ws/jiajyang-ott/util/vim/bin'
        export EDITOR='$VIM/vim'
        alias vim='$VIM/vim'
        alias gvim='$VIM/gvim'
        alias ctags='/ws/jiajyang-ott/util/ctags/bin/ctags'
    fi
fi
export CSCOPE_EDITOR=vim
export EDITOR=vim

alias xosview='/users/jiajyang/util/xosview-1.8.3/xosview -int &'

## VNC & Lab
alias	vnc_start='vncserver -geometry 1600x900 -randr 1600x900 &'
alias	vnc_start_1080p='vncserver -geometry 1920x1080 -randr 1920x1080 &'
alias   xr_bld='/auto/iox/bin/xr_bld'
alias 	xterm='/usr/bin/xterm -fn fixed -bg black -fg green -aw -sl 8000 -sb &' 
alias   xterm_aux='/usr/bin/xterm -fn fixed -bg grey18 -fg green -aw -sl 8000 -sb &'
alias   xterm_stdby='/usr/bin/xterm -fn fixed -bg black -fg CadetBlue1 -aw -sl 8000 -sb &'
alias   xterm_stdby_aux='/usr/bin/xterm -fn fixed -bg grey18 -fg CadetBlue1 -aw -sl 8000 -sb &'

alias 	jiajyang-ott='ssh jiajyang-ott'
alias   jiajyang-ott-ads='ssh jiajyang-ott-ads'
alias   jiajyang-ott-lb='ssh jiajyang-ott-lb'
 
## If not running interactively, don't do anything
#[[ $- != *i* ]] && return

#xfind () { find . -type f | xargs egrep "$1";}

## User specific Aliases
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'

alias cd..='cd ..'
alias ws='cd /nobackup/jiajyang/'

alias vi='vim'

# Alias for shortening paths
#alias xr_bld='csh -c /auto/iox/bin/xr_bld'


# TFTP
alias tftp-ott='cd /auto/tftpboot-ottawa/jiajyang'
alias tftp-sjc='cd /auto/tftp-sjc-users2/jiajyang'

# Container PODMAN
alias buildah="sudo /ecs/utils/container/bin/subuildah"
alias podman="sudo /ecs/utils/container/bin/supodman"
alias docker="sudo /ecs/utils/container/bin/supodman"

# git
alias gitlog="git log --branches --not --remotes --decorate --oneline"

# smartdev
alias sparse="/auto/smartdev/bin/sparse"


