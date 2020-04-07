# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=vim

# Path to your oh-my-zsh installation.
export ZSH="/users/jiajyang/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#applications
export MP_FULLNAME="Jiajian Yang"

# PATH
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/cisco/bin:/router/bin:/users/jiajyang/bin:$PATH

# FireX 
alias firex=/auto/firex/bin/firex
alias firex_precommit=/auto/firex/bin/precommit

# Application Shortcuts
alias tmux='/ws/jiajyang-ott/util/tmux/tmux'
alias progress='/ws/jiajyang-ott/util/progress/progress'


export TERM=xterm-color

export CLICOLOR=1

dircolor=/users/jiajyang/.dir_colours
test -r $d && eval "$(dircolors $d)"

export LS_COLORS=$LS_COLORS
export LS_OPTIONS='--color=auto'


alias pycharm='/ws/jiajyang-ott/pycharm-community-latest/bin/pycharm.sh'

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
if [[ -a /etc/redhat-release ]]
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
        export VIMRUNTIME='/ws/jiajyang-ott/util/vim/runtime'
        export VIM='/ws/jiajyang-ott/util/vim/src'
        export EDITOR='$VIM/vim'
        alias vim='$VIM/vim'

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
