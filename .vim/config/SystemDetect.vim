"-----------------------------------------------------------------
" system info detect
"-----------------------------------------------------------------
    function! MySys()
        if has("win16") || has("win32") || has("win64") || has("win95")
            return "windows"
        elseif has("unix")
            return "linux"
        endif
    endfunction
"-----------------------------------------------------------------
" fontface and charset
"-----------------------------------------------------------------
    if MySys() == "windows"
        set guifont=Monaco:h12:cANSI
    endif
    if MySys() == "linux"
        " set guifont=monofur\ 12
        set guifont=novamono\ 11
    endif
    " multi font coding support
    if has("multi_byte")
        set encoding=utf-8
        set termencoding=utf-8
        set formatoptions+=mM
        set fileencodings=utf-8,gbk
        " set ambiwidth=double
        if has("win32")
            source $VIMRUNTIME/delmenu.vim
            source $VIMRUNTIME/menu.vim
            language messages en_US.utf-8
        endif
    else
        echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
    endif
"-----------------------------------------------------------------
" cursor in terminal
"-----------------------------------------------------------------
    if &term =~ 'rxvt.*' && $TMUX != ''
        autocmd VimEnter * silent !echo -e "\033Ptmux;\033\033]12;2\007\033\\"
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]12;4\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]12;2\x7\<Esc>\\"
        autocmd VimLeave * silent !echo -e "\033Ptmux;\033\033]12;14\007\033\\"
    endif
    if &term =~ 'xterm.*'
        " 1 or 0 -> blinking block
        " 2 -> solid block
        " 3 -> blinking underscore
        " 4 -> solid underscore
        " 5 -> blinking vertical bar
        " 6 -> solid vertical bar
        set t_Co=16
        autocmd VimEnter * silent !echo -e "\033]12;green\007"
        let &t_SI = "\<Esc>\<Esc>]12;blue\x7"
        let &t_EI = "\<Esc>\<Esc>]12;green\x7"
        autocmd VimLeave * silent !echo -e "\033\033]12;white\007"
        let &t_SI .= "\<Esc>[3 q"
        let &t_EI .= "\<Esc>[2 q"
    endif
    " if !has("gui_running") && &term =~ 'screen.*'
    "     autocmd InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Solarized/cursor_shape ibeam"
    "     autocmd InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Solarized/cursor_shape block"
    "     autocmd VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Solarized/cursor_shape block"
    " endif

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
