"-----------------------------------------------------------------
" variables setting
"-----------------------------------------------------------------
    syntax on                                              " highlight
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
    set autoindent                                         " autoindent
    set autochdir                                          " auto change directory to current file's
    set nowrap                                             " do not wrap long lines
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
    set foldlevelstart=5                                   " no fold on start
    set scroll=15                                          " C-u,C-d scroll 15 lines each time
    set scrolloff=10                                       " scroll remain the cursor 10 lines off the edge
    set completeopt=longest,menuone                        " complete option
    set showbreak="↪ "                                     " prefix of wrapped line
    set viminfo='10,\"100,:20,%,!                          " save viminfo with upto 10 marks 100-line registers and 20 lines of commands and global variables
    set cscopequickfix=s-,c-,d-,i-,t-,e-                   " use quickfix to show cscope results
    set updatetime=6000                                    " update intervals
    set lines=55 columns=150                               " window size
    " set t_Co=256                                           " 256color
    set background=dark                                    " Colorscheme
    set guioptions=Ac                                      " simple GUI without toolbar menubar scrollbar messagebox
    set pastetoggle=<F4>                                   " toggle pastemode
    set splitright
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store
    if executable('ag')
        set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
        set grepformat=%f:%l:%c:%m
    endif

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
    filetype off                   " required!
    set runtimepath+=~/.vim/exbundle/eclim/eclim/
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
    " utilities
        NeoBundleFetch 'Shougo/neobundle.vim'
        NeoBundle 'farseer90718/vim-translator'
        NeoBundle 'farseer90718/vim-taskwarrior'
        NeoBundle 'chrisbra/NrrwRgn'
        NeoBundle 'rking/ag.vim'
        NeoBundle 'tpope/vim-afterimage'
        NeoBundle 'tpope/vim-fugitive'
        NeoBundle 'tpope/vim-eunuch'
        NeoBundle 'mattn/calendar-vim'
        NeoBundle 'kakkyz81/evervim'
        NeoBundle 'yuratomo/w3m.vim'
        NeoBundle 'arecarn/crunch'
        NeoBundle 'benmills/vimux'
        NeoBundle 'vimim/vimim'
        NeoBundle 'mattn/webapi-vim'
        NeoBundle 'mattn/gist-vim'
        NeoBundle 'LnL7/vim-mark'
        NeoBundle 'zoom.vim'
        NeoBundle 'DrawIt'
    " web develope
        NeoBundle 'mattn/emmet-vim'
        NeoBundle 'greyblake/vim-preview'
        NeoBundle 'lilydjwg/colorizer'
        NeoBundle 'farseer90718/vim-colorpicker'
    " Unite.vim
        NeoBundle 'Shougo/vimproc'
        NeoBundle 'Shougo/unite.vim'
        NeoBundle 'Shougo/vimfiler.vim'
        NeoBundle 'farseer90718/unite-character'
        NeoBundleLazy 'Shougo/unite-help', {'autoload':{'unite_sources':'help'}}
        NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}}
        NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':'colorscheme'}}
        NeoBundleLazy 'ujihisa/unite-locate', {'autoload':{'unite_sources':'locate'}}
        NeoBundleLazy 'farseer90718/unite-apropos', {'autoload':{'unite_sources':'apropos'}}
        NeoBundleLazy 'tsukkee/unite-tag', {'autoload':{'unite_sources':'tag'}}
        NeoBundleLazy 'tacroe/unite-mark', {'autoload':{'unite_sources':'mark'}}
    " IDE functions
        NeoBundle 'scrooloose/syntastic'
        NeoBundle 'ervandew/supertab'
        NeoBundle 'Shougo/neocomplete.vim'
        NeoBundle 'Shougo/neosnippet'
        NeoBundle 'Shougo/vimshell.vim'
        NeoBundle 'tpope/vim-dispatch'
        NeoBundle 'marijnh/tern_for_vim'
        NeoBundle 'xolox/vim-misc'
        NeoBundle 'xolox/vim-easytags'
        NeoBundle 'cmdline-completion'
        NeoBundle 'clang'
        NeoBundle 'clang-complete'
    " appearance
        NeoBundle 'bling/vim-airline'
        NeoBundle 'koron/minimap-vim'
        NeoBundle 'joeytwiddle/sexy_scroller.vim'
        NeoBundle 'farseer90718/Rainbow-Parentheses-Improved-and2'
        NeoBundle 'nathanaelkane/vim-indent-guides'
        NeoBundle 'mhinz/vim-signify'
        NeoBundle 'sjl/gundo.vim'
        NeoBundle 'tomasr/molokai'
        NeoBundle 'chriskempson/vim-tomorrow-theme'
        NeoBundle 'altercation/vim-colors-solarized'
        NeoBundle 'farseer90718/vim-regionsyntax'
        NeoBundle 'https://bitbucket.org/abudden/taghighlight'
        if MySys() == "windows"
            NeoBundle 'mattn/vimtweak'
        endif
    " navigate
        NeoBundle 'farseer90718/bclose.vim'
        NeoBundle 'Lokaltog/vim-easymotion'
        NeoBundle 'majutsushi/tagbar'
        NeoBundle 'tsaleh/vim-matchit'
        NeoBundle 'mhinz/vim-startify'
        NeoBundle 'kien/ctrlp.vim'
    " fast edit
        NeoBundle 'tpope/vim-surround'
        NeoBundle 'tpope/vim-abolish'
        NeoBundle 'terryma/vim-multiple-cursors'
        NeoBundle 'Raimondi/delimitMate'
        NeoBundle 'renumber.vim'
        NeoBundle 'Figlet.vim'
        NeoBundle 'Align'
        NeoBundle 'tComment'
    " textobj
        NeoBundle 'coderifous/textobj-word-column.vim'
        NeoBundle 'kana/vim-textobj-user'
        NeoBundle 'thinca/vim-textobj-between'
        NeoBundle 'kana/vim-textobj-function'
        NeoBundle 'kana/vim-textobj-indent'
        NeoBundle 'sgur/vim-textobj-parameter'
        NeoBundle 'mattn/vim-textobj-url'
    " languages support
        NeoBundle 'vimwiki/vimwiki'
        NeoBundleLazy 'gerw/vim-latex-suite', {'autoload':{'filetypes':['tex']}}
        NeoBundleLazy 'xuhdev/vim-latex-live-preview', {'autoload':{'filetypes':['tex']}}
        NeoBundleLazy 'vim-perl/vim-perl', {'autoload':{'filetypes':['perl']}}
        NeoBundleLazy 'klen/python-mode', {'autoload':{'filetypes':['python']}}
        NeoBundleLazy 'plasticboy/vim-markdown', {'autoload':{'filetypes':['mkd']}}
        NeoBundleLazy 'https://bitbucket.org/kovisoft/slimv', {'autoload':{'filetypes':['lisp']}}
        NeoBundleCheck

    filetype plugin indent on     " required!
    if &term =~ 'linux'
        colorscheme darkblue
    else
        colorscheme solarized
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
