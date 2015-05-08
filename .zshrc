#------------------------------------------------------------------antigen-------------------------------------------------------------------------{
source $HOME/.profile
source $HOME/.antigen/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle archlinux
antigen bundle dircycle
antigen bundle dirpersist
antigen bundle extract
# antigen bundle fbterm
antigen bundle git-extras
antigen bundle nmap
antigen bundle npm
antigen bundle pip
antigen bundle rsync
antigen bundle themes

antigen bundle supercrabtree/k
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle hchbaw/auto-fu.zsh
antigen bundle farseer90718/zsh-funcs
antigen bundle trapd00r/zsh-syntax-highlighting-filetypes

antigen apply

fpath=(~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions.git/src/ $fpath)

#--------------------------------------------------------------------------------------------------------------------------------------------------}
#------------------------------------------------------------------options-------------------------------------------------------------------------{

unsetopt correct_all
autoload -U compinit
autoload -U colors && colors
compinit
# ls color solarized
eval `dircolors ~/.dircolors`

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
# setopt menu_complete

limit coredumpsize 0

#--------------------------------------------------------------------------------------------------------------------------------------------------}
#------------------------------------------------------------------keybind-------------------------------------------------------------------------{

bindkey -v
bindkey -M vicmd 'gh' vi-beginning-of-line
bindkey -M vicmd 'gl' vi-end-of-line
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M viins '^K' insert-cycledleft
bindkey -M viins '^J' insert-cycledright
bindkey -M viins '^B' backward-word
bindkey -M viins '^F' forward-word
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M vicmd 'u'  undo
bindkey -M vicmd '^R' redo
bindkey -M menuselect 'h' vi-backward-char                # left
bindkey -M menuselect 'j' vi-down-line-or-history         # down
bindkey -M menuselect 'k' vi-up-line-or-history           # up
bindkey -M menuselect 'l' vi-forward-char                 # right
bindkey '^T' fzf-file-widget
bindkey '^L' fzf-cd-widget
bindkey '^H' fzf-history-widget
bindkey '^N' history-search-forward
bindkey '^P' history-search-backward

#--------------------------------------------------------------------------------------------------------------------------------------------------}
#------------------------------------------------------------------complete------------------------------------------------------------------------{

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/tmp/.zcache
zstyle ':completion:*:cd:*' ignore-parents parent pwd

zstyle ':completion:*' completer _oldlist _complete
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always

zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -u $USER'

zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $' \e[30;42m %d \e[0m\e[32m\e[0m'
zstyle ':completion:*:messages' format $' \e[30;45m %d \e[0m\e[35m\e[0m'
zstyle ':completion:*:warnings' format $' \e[30;41m No Match Found \e[0m\e[31m\e[0m'

my_accounts=(
    git@github.com
    farseer90718@github.com
    orcking@home.ustc.edu.cn
    mobile@192.168.
    root@192.168.
)

zstyle ':completion:*:my-accounts' users-hosts $my_accounts

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
alias ubuntu='sudo chroot /media/ubuntu /bin/su farseer'
alias archlinux='sudo chroot /media/arch /bin/su farseer'
alias ve2='source ~/.virtualenv/py2/bin/activate'
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
alias pl='ls++ --potsf'
alias pla='ls++ --potsf -a'
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
