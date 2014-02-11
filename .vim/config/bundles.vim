"-----------------------------------------------------------------
" utilities
"-----------------------------------------------------------------
    NeoBundleFetch 'Shougo/neobundle.vim'
    NeoBundle 'chrisbra/NrrwRgn'
    NeoBundle 'tpope/vim-afterimage'
    NeoBundle 'tpope/vim-eunuch'
    " NeoBundle 'mattn/calendar-vim'
    NeoBundle 'itchyny/calendar.vim'
    NeoBundle 'arecarn/crunch'
    NeoBundle 'benmills/vimux'
    NeoBundle 'vimim/vimim'
    NeoBundle 'LnL7/vim-mark'
    NeoBundle 'zoom.vim'
    NeoBundle 'DrawIt'
    NeoBundle 'tpope/vim-fugitive',           {'disabled': (!executable('git'))}
    NeoBundle 'Figlet.vim',                   {'disabled': (!executable('figlet'))}
    NeoBundle 'farseer90718/vim-taskwarrior', {'disabled': (!executable('task'))}
"-----------------------------------------------------------------
" network
"-----------------------------------------------------------------
    NeoBundle 'kakkyz81/evervim'
    NeoBundle 'junegunn/vim-github-dashboard'
    NeoBundle 'farseer90718/vim-translator'
    NeoBundle 'mattn/gist-vim',   {'depends': ['mattn/webapi-vim']}
    NeoBundle 'yuratomo/w3m.vim', {'disabled': (!executable('w3m'))}
"-----------------------------------------------------------------
" frontend
"-----------------------------------------------------------------
    NeoBundle 'mattn/emmet-vim'
    NeoBundle 'greyblake/vim-preview'
    NeoBundle 'lilydjwg/colorizer'
    NeoBundle 'farseer90718/vim-colorpicker', {'disabled': (!has('python'))}
"-----------------------------------------------------------------
" Unite.vim
"-----------------------------------------------------------------
    NeoBundle 'Shougo/vimfiler.vim',              {'depends': 'Shougo/unite.vim'}
    NeoBundle 'hewes/unite-gtags',                {'depends': 'Shougo/unite.vim'}
    NeoBundleLazy 'Shougo/unite-help',            {'autoload': {'unite_sources': 'help'}}
    NeoBundleLazy 'Shougo/unite-outline',         {'autoload': {'unite_sources': 'outline'}}
    NeoBundleLazy 'ujihisa/unite-colorscheme',    {'autoload': {'unite_sources': 'colorscheme'}}
    NeoBundleLazy 'ujihisa/unite-locate',         {'autoload': {'unite_sources': 'locate'}}
    NeoBundleLazy 'tsukkee/unite-tag',            {'autoload': {'unite_sources': 'tag'}}
    NeoBundleLazy 'tacroe/unite-mark',            {'autoload': {'unite_sources': 'mark'}}
    NeoBundleLazy 'farseer90718/unite-apropos',   {'autoload': {'unite_sources': 'apropos'}}
    NeoBundleLazy 'farseer90718/unite-character', {'autoload': {'commands': ['SearchUnicode', 'HTMLUnicode'], 'unite_sources': 'character'}}
"-----------------------------------------------------------------
" IDE features
"-----------------------------------------------------------------
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'tpope/vim-dispatch'
    NeoBundle 'tpope/vim-endwise'
    NeoBundle 'cmdline-completion'
    NeoBundle 'gtags.vim'
    NeoBundle 'Shougo/vimshell.vim',         {'depends': 'Shougo/vimproc'}
    NeoBundle 'Shougo/neocomplete.vim',      {'disabled': (!has('lua'))}
    NeoBundle 'Shougo/context_filetype.vim', {'depends': 'Shougo/neocomplete.vim'}
    NeoBundle 'Shougo/neosnippet',           {'depends': 'Shougo/neocomplete.vim'}
    NeoBundle 'Shougo/neosnippet-snippets',  {'depends': 'Shougo/neosnippet'}
    NeoBundleLazy 'Valloric/YouCompleteMe',  {'autoload': {'filetypes':['c', 'cpp', 'python']}, 'disabled': (!has('python'))}
"-----------------------------------------------------------------
" appearance
"-----------------------------------------------------------------
    NeoBundle 'bling/vim-airline'
    NeoBundle 'joeytwiddle/sexy_scroller.vim'
    NeoBundle 'farseer90718/Rainbow-Parentheses-Improved-and2'
    NeoBundle 'nathanaelkane/vim-indent-guides'
    NeoBundle 'mhinz/vim-signify'
    NeoBundle 'sjl/gundo.vim'
    NeoBundle 'farseer90718/vim-regionsyntax'
    NeoBundle 'osyo-manga/vim-over'
    NeoBundle 'tomasr/molokai',                             {'script_type': 'colors'}
    NeoBundle 'junegunn/seoul256.vim',                      {'script_type': 'colors'}
    NeoBundle 'chriskempson/vim-tomorrow-theme',            {'script_type': 'colors'}
    NeoBundle 'altercation/vim-colors-solarized',           {'script_type': 'colors'}
    NeoBundle 'mattn/vimtweak',                             {'disabled': has('unix')}
    NeoBundle 'https://bitbucket.org/abudden/taghighlight', {'type': 'hg' }
"-----------------------------------------------------------------
" navigate
"-----------------------------------------------------------------
    NeoBundle 'farseer90718/miscellaneous'
    NeoBundle 'Lokaltog/vim-easymotion'
    NeoBundle 'majutsushi/tagbar'
    NeoBundle 'tsaleh/vim-matchit'
    NeoBundle 'mhinz/vim-startify'
    NeoBundle 'kien/ctrlp.vim'
"-----------------------------------------------------------------
" text trimming
"-----------------------------------------------------------------
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'tpope/vim-speeddating'
    NeoBundle 'tpope/vim-repeat'
    NeoBundle 'terryma/vim-multiple-cursors'
    NeoBundle 'Raimondi/delimitMate'
    NeoBundle 'junegunn/vim-easy-align'
    NeoBundle 'swap-parameters'
    NeoBundle 'renumber.vim'
    NeoBundle 'tComment'
"-----------------------------------------------------------------
" textobj
"-----------------------------------------------------------------
    NeoBundle 'coderifous/textobj-word-column.vim'
    NeoBundle 'thinca/vim-textobj-between', {'depends': 'kana/vim-textobj-user'}
    NeoBundle 'kana/vim-textobj-function',  {'depends': 'kana/vim-textobj-user'}
    NeoBundle 'kana/vim-textobj-indent',    {'depends': 'kana/vim-textobj-user'}
    NeoBundle 'sgur/vim-textobj-parameter', {'depends': 'kana/vim-textobj-user'}
    NeoBundle 'mattn/vim-textobj-url',      {'depends': 'kana/vim-textobj-user'}
"-----------------------------------------------------------------
" language suites
"-----------------------------------------------------------------
    NeoBundle 'vimwiki/vimwiki'
    NeoBundle 'moll/vim-node'
    NeoBundleLazy 'gerw/vim-latex-suite',                 {'autoload': {'filetypes': ['tex']}}
    NeoBundleLazy 'vim-perl/vim-perl',                    {'autoload': {'filetypes': ['perl']}}
    NeoBundleLazy 'farseer90718/vim-markdown',            {'autoload': {'filetypes': ['markdown']}}
    NeoBundleLazy 'farseer90718/vim-reveal',              {'autoload': {'filetypes': ['markdown']}}
    NeoBundleLazy 'wannesm/wmgraphviz.vim',               {'autoload': {'filetypes': ['dot']}}
    NeoBundleLazy 'marijnh/tern_for_vim',                 {'autoload': {'filetypes': ['javascript']}}
    NeoBundleLazy 'eclim',                                {'autoload': {'filetypes': ['java']}}
    NeoBundleLazy 'https://bitbucket.org/kovisoft/slimv', {'autoload': {'filetypes': ['lisp']}, 'type': 'hg'}

    NeoBundleCheck
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
" vim:ts=4:sw=4:tw=78:ft=vim:fdm=indent:fdl=0
