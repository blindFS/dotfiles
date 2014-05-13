"-----------------------------------------------------------------
" variables setting
"-----------------------------------------------------------------
    syntax on                                              " highlight
    set undodir=~/tmp/.undo                                " directory of undo files
    set undofile                                           " enable undo file
    set backupdir=~/tmp/                                   " ~ file directory
    set directory=~/tmp/                                   " swap file directory
    set shell=bash                                         " default shell
    set nocompatible                                       " no compatible with vi
    set number                                             " show line numbers
    set relativenumber                                     " line numbers relative to current line
    set cursorline                                         " outline current line
    set cursorcolumn                                       " outline current column
    set shiftwidth=4 et                                    " indent width
    set shiftround                                         " <<>>always move to the shift-width boundary
    set softtabstop=4                                      " backspace delete 4 spaces a time
    set tabstop=4                                          " tab take 4 spaces
    set smarttab                                           " a <Tab> in front of a line inserts blanks according to 'shiftwidth'
    set autoread                                           " auto read changed file
    set autoindent                                         " autoindent
    set autochdir                                          " auto change directory to current file's
    set nowrap                                             " do not wrap long lines
    set showbreak="↪ "                                     " prefix of wrapped line
    set backupcopy=yes                                     " overwrite backup files
    set ignorecase                                         " search and command complete ignorecase
    " set smartcase                                          " smart case
    set wildmenu                                           " command line enhance
    set wildignorecase                                     " wild menu ignore case
    set wildmode=list,full                                 " command line complete options
    set wrapscan                                           " rescan file
    set incsearch                                          " show search output at once
    set hlsearch                                           " highlight found pattern
    set noerrorbells                                       " no error bell
    set novisualbell                                       " no visual bell
    set clipboard=autoselectplus                           " auto yank selected to clipboard
    set t_vb=                                              " empty terminal error code
    set magic                                              " magic regex
    set timeoutlen=2000                                    " macro key delay 3s
    set hidden                                             " can load a buffer in a window that currently has a modified buffer
    set smartindent                                        " auto indent
    set backspace=indent,eol,start                         " use backspace to delete
    set cmdheight=1                                        " set command line height
    set laststatus=2                                       " show status bar
    set noshowmode                                         " Hide the default mode text (e.g. -- INSERT -- below the statusline)
    set showcmd                                            " show partial command at the bottom-right of the screen
    set foldenable                                         " enable code fold
    set foldmethod=indent                                  " fold method
    set foldcolumn=0                                       " folded code take up no column
    set foldlevelstart=99                                  " no fold on start
    set scroll=15                                          " C-u,C-d scroll 15 lines each time
    " set scrolloff=5                                        " scroll remain the cursor n lines off the edge
    set completeopt=longest,menuone                        " complete option
    set viminfo='10,\"100,:20,%,!                          " save viminfo with upto 10 marks 100-line registers and 20 lines of commands and global variables
    set cscopequickfix=s-,c-,d-,i-,t-,e-                   " use quickfix to show cscope results
    set updatetime=6000                                    " update intervals
    set lines=55 columns=150                               " window size
    " set t_Co=256                                           " 256color
    set background=dark                                    " Colorscheme
    set guioptions=Ac                                      " simple GUI without toolbar menubar scrollbar messagebox
    set pastetoggle=<F4>                                   " toggle pastemode
    set splitright                                         " split on the right side
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store
    set path+=./include,../include,/opt/cuda/include
    if executable('ag')
        set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
        set grepformat=%f:%l:%c:%m
    endif

    " set csprg=gtags-cscope
    " cscope add ~/src/linux-3.11.6/GTAGS
    " cscope add ~/src/linux-3.11.6/cscope.out
    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
    set tags+=~/.vim/tags
"-----------------------------------------------------------------
" load configurations
"-----------------------------------------------------------------
    source ~/.vim/config/SystemDetect.vim              " config accordingly
    source ~/.vim/config/AutoCommand.vim               " autocmds
    source ~/.vim/config/MapCommand.vim                " map and command
    source ~/.vim/config/GlobalVariables.vim           " global variable set
    " source $VIMRUNTIME/mswin.vim                       " <C-c><C-v> copy paste
    runtime ftplugin/man.vim                           " better man page
"-----------------------------------------------------------------
" Plugin Bundles
"-----------------------------------------------------------------
    filetype off
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
    source ~/.vim/config/Bundles.vim
    filetype plugin indent on
    if has('gui_running')
        colorscheme seoul256
    else
        if &term =~ 'linux'
            colorscheme darkblue
        else
            colorscheme solarized
        endif
    endif

"------------------------------------------------------------------------------------------------------------------------------------
    "                                  ..                                  _                      __ _                    _   _
    "               ......'...          ...                           __ _(_)_ __    __ ___ _ _  / _(_)__ _ _  _ _ _ __ _| |_(_)___ _ _
    "                    ...,;,..       ..;,.       .                 \ V / | '  \  / _/ _ \ ' \|  _| / _` | || | '_/ _` |  _| / _ \ ' \
    "                       ..::.       .;c:...     ..                 \_/|_|_|_|_| \__\___/_||_|_| |_\__, |\_,_|_| \__,_|\__|_\___/_||_|
    "             ...       .,,.       .,:c.        .'.                                               |___/
    "      .......,:c.      ,oo.     .lxd:.        ..';.
    "             ..,.      d0kkdl;;ooxxo:...    .':cc,.
    "               ..dd::;d:;'..,.,..',':;,;okxxkdoc...
    "       ..      .lOkl;,.......  ....,...,ccodl.        ..
    "    .'cox'    .ll;'...               ..'''',,.      .',
    "  .'.......,:lo:,...                   ...':kx:..,;cxc.
    " .         ;dl:...        ..             ..,dox;,::,'.
    "           ':;'..      ..       ..       .,':ll,.
    "   .,l,...;xc,.       '. .........      .,::,;,.       ...
    "  ';..  ..;l;.'       ,..,.     .       ',. .;c:'.'''....
    " ..       .,,'.       ';,;             .l,'',:c:llxc'...
    "           ;o'.       .;:,.           'o,....,;coll,..
    "     .....;oxl..      ...',.        'c:......';::c;'.
    "     l,. .  .::,.      ..  .'''.',;:;.......';ccc:.
    "    '.       .;:,.       ....       .....',;clc:'.
    "    .       .:c;,'.         ...........',;:lol'.
    "         .........':.          .....',,;cl:;'.
    "         .'        .',..             ......                                     _        _   _           ___
    "         ...        ....... .                                     _ __  ___  __| |___ __| | | |__ _  _  | __|_ _ _ _ ___ ___ ___ _ _
    "           .        ,;'.. ..'..                                  | '  \/ _ \/ _` / -_) _` | | '_ \ || | | _/ _` | '_(_-</ -_) -_) '_|
    "                   .:,..... .,,...                               |_|_|_\___/\__,_\___\__,_| |_.__/\_, | |_|\__,_|_| /__/\___\___|_|
    "         .       ..'...........                                                                    |__/
    "           ...............
"-------------------------------------------------------------------------------------------------------------------------------------
" vim:ts=4:sw=4:tw=78:ft=vim:fdm=indent:fdl=1
