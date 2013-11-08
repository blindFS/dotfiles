"-----------------------------------------------------------------
" Autocommands
"-----------------------------------------------------------------
" miscellaneous
    autocmd BufWinEnter *                      set formatoptions-=o " disable new line autocomment
    autocmd BufRead,BufNewFile *.json          setlocal filetype=json
    autocmd BufRead,BufNewFile *.less          setlocal filetype=css
    autocmd Filetype w3m,tagbar,unite,startify setlocal nocursorcolumn
    autocmd FileType lisp                      setlocal tabstop=2 shiftwidth=2
    autocmd FileType lisp                      let b:delimitMate_autoclose = 0
    autocmd FileType vim                       nnoremap <buffer> K :help <cword><CR>
    autocmd FileType vim                       vnoremap <buffer> K <ESC>:execute "help ".GetVisualSelection()<CR>
    autocmd Syntax man                         setlocal nomodifiable

" number/relativenumber
    autocmd InsertLeave * if &number|setlocal relativenumber|endif
    autocmd InsertEnter * setlocal norelativenumber

" folding
    autocmd FileType html                                           setlocal foldmethod=manual
    autocmd Filetype xml                                            setlocal foldmethod=syntax
    autocmd Filetype vimwiki,perl,c,cpp,java,javascript,css,zsh,lua setlocal foldmethod=marker " html folding using indent
    autocmd Filetype vimwiki,perl,c,cpp,java,javascript,css,zsh,lua setlocal foldmarker={,}

" complete
    autocmd FileType java   setlocal omnifunc=eclim#java#complete#CodeComplete
    autocmd FileType java   let g:SuperTabDefaultCompletionType="<C-x><C-o>"
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" restore
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END
    autocmd BufWinEnter * silent! loadview

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
