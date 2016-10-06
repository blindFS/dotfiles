#------------------------------------------------------------------antigen-------------------------------------------------------------------------{
zmodload zsh/zprof
zmodload zsh/complist

source $HOME/.profile
source $HOME/.zplug/init.zsh

DIRSTACKSIZE=99
HISTORY_BASE=$HOME/tmp/.directory_history/

zplug "lib/directory",                          from:oh-my-zsh
zplug "lib/history",                            from:oh-my-zsh
zplug "plugins/archlinux",                      from:oh-my-zsh
zplug "plugins/dirpersist",                     from:oh-my-zsh
zplug "plugins/extract",                        from:oh-my-zsh
zplug "plugins/fbterm",                         from:oh-my-zsh
zplug "plugins/git-extras",                     from:oh-my-zsh
zplug "plugins/nmap",                           from:oh-my-zsh
zplug "plugins/pip",                            from:oh-my-zsh
zplug "plugins/per-directory-history",          from:oh-my-zsh

zplug "blindFS/zsh-funcs"
zplug "zsh-users/zsh-syntax-highlighting",      nice:10
zplug "zsh-users/zsh-history-substring-search", nice:19
zplug "hlissner/zsh-autopair",                  nice:19
zplug "b4b4r07/enhancd",                        use:init.sh
zplug "jimmijj/chromatic-zsh",                  use:"{config.zsh,completion.zsh}", nice:19
# zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

if zplug check b4b4r07/enhancd; then
    ENHANCD_DIR=$HOME/tmp/.enhancd/
    ENHANCD_FILTER=fzf
    ENHANCD_DISABLE_HOME=1
fi

if zplug check zsh-users/zsh-syntax-highlighting; then
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
    ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue'
    ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=green'
    ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow'
fi

zplug load
compinit

#--------------------------------------------------------------------------------------------------------------------------------------------------}
#------------------------------------------------------------------options-------------------------------------------------------------------------{

unsetopt correct_all
unsetopt menu_complete
unsetopt flowcontrol
setopt inc_append_history
setopt hist_ignore_dups
setopt extended_history
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_list
setopt auto_menu
setopt hist_ignore_space
setopt interactive_comments
setopt auto_cd
setopt complete_in_word

limit coredumpsize 0

#--------------------------------------------------------------------------------------------------------------------------------------------------}
#------------------------------------------------------------------keybind-------------------------------------------------------------------------{

bindkey -v
bindkey -M vicmd 'gh' vi-beginning-of-line
bindkey -M vicmd 'gl' vi-end-of-line
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M vicmd 'u'  undo
bindkey -M vicmd '^R' redo
bindkey -M viins '^K' kill-line
bindkey -M viins '^B' backward-word
bindkey -M viins '^F' forward-word
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

FZF_TMUX=-1
bindkey '^T' fzf-file-widget
bindkey '^Z' fzf-ds-widget
bindkey '^H' fzf-history-widget
bindkey '^I' fzf-completion
bindkey '^N' history-search-forward
bindkey '^P' history-search-backward

#--------------------------------------------------------------------------------------------------------------------------------------------------}
#--------------------------------------------------------------------misc--------------------------------------------------------------------------{
# for wildcards
setopt GLOB_COMPLETE
zle -C complete-glob menu-complete compglob
compglob () {
    setopt localoptions globsubst
    compset -P '*'
    files=(${IPREFIX}*)
    display=(${files/${IPREFIX}/${(q)IPREFIX}})
    glob=(${files/${IPREFIX}/})
    compadd -d display -- $glob
}
bindkey "^O" complete-glob

sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line
}
zle -N sudo-command-line
bindkey '^R' sudo-command-line

#--------------------------------------------------------------------------------------------------------------------------------------------------}
#------------------------------------------------------------------alias---------------------------------------------------------------------------{

### universal
alias java_proxy='JAVA_OPTS="$JAVA_OPTS -Dhttp.proxyHost=localhost -Dhttp.proxyPort=8123 "'
alias cp='cp -i'
alias mv='mv -i'
alias pcp='rsync -aP'
alias mkdir='mkdir -p'
alias rm='rm -i'
alias vims='vim --servername VIM'
alias vimr='vim --remote'
alias aria2-rpc='cd ~/Downloads && aria2c --enable-rpc --rpc-listen-all&'
alias von='sudo vbetool dpms on'
alias voff='sudo vbetool dpms off'
alias jp2a='jp2a --color'
alias grep='grep --color=auto'
alias ll='ls -alF --color=auto'
alias ls='ls --color=auto'
alias du='du --max-depth=1 -h'
alias xopen='xdg-open'
alias cl='clear'
alias ccat='pygmentize -g'
alias bbs='luit -encoding gbk telnet bbs.ustc.edu.cn'
alias externalip='curl icanhazip.com'
alias reboot='sudo reboot'
alias systemctl='sudo systemctl'
alias halt='sudo halt'
alias tcpdump='sudo tcpdump -i any'
alias top10='print -l  ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

#--------------------------------------------------------------------------------------------------------------------------------------------------}
#------------------------------------------------------------------prompt--------------------------------------------------------------------------{

if [[ $TERM == "linux" ]]; then
    antigen theme gozilla
    export DISPLAY=:0
    TERM=fbterm
    eval `dircolors ~/.dircolors-fbterm`
elif [[ $TERM == "vt100" ]] ; then
    antigen theme nanotech
fi

#--------------------------------------------------------------------------------------------------------------------------------------------------}
#  vim:ts=4:sw=4:tw=0:ft=zsh:fdm=marker:fdl=0
