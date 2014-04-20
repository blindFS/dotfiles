"-----------------------------------------------------------------
" cscope
"-----------------------------------------------------------------
    nnoremap <leader>cg :execute 'cscope find g '.expand('<cword>')<CR>
    nnoremap <leader>cs :execute 'cscope find s '.expand('<cword>')<CR>
    nnoremap <leader>cc :execute 'cscope find c '.expand('<cword>')<CR>
    nnoremap <leader>ct :execute 'cscope find t '.expand('<cword>')<CR>
    nnoremap <leader>cf :execute 'cscope find f '.expand('<cword>')<CR>
    nnoremap <leader>ci :execute 'cscope find i '.expand('<cword>')<CR>
    vnoremap <leader>cg <ESC>:execute 'cscope find g '.GetVisualSelection()<CR>
    vnoremap <leader>cs <ESC>:execute 'cscope find s '.GetVisualSelection()<CR>
    vnoremap <leader>cc <ESC>:execute 'cscope find c '.GetVisualSelection()<CR>
    vnoremap <leader>ct <ESC>:execute 'cscope find t '.GetVisualSelection()<CR>
    vnoremap <leader>cf <ESC>:execute 'cscope find f '.GetVisualSelection()<CR>
    vnoremap <leader>ci <ESC>:execute 'cscope find i '.GetVisualSelection()<CR>
"-----------------------------------------------------------------
" go head or end of line
"-----------------------------------------------------------------
    nnoremap gh ^
    nnoremap gl $
    vnoremap gh ^
    vnoremap gl $
    vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z
"-----------------------------------------------------------------
" add sth to end of line
"-----------------------------------------------------------------
    nnoremap '; mzA;<esc>`z
    nnoremap ', mzA,<esc>`z
    nnoremap '. mzA.<esc>`z
"-----------------------------------------------------------------
" buffer control
"-----------------------------------------------------------------
    nmap <C-TAB>        :tabnext<CR>
    nmap <C-S-TAB>      :tabprevious<CR>
    nnoremap ]b         :bnext<CR>
    nnoremap [b         :bprevious<CR>
    nnoremap ]t         :tabnext<CR>
    nnoremap [t         :tabprevious<CR>
    nnoremap <Leader>dd :Bclose!<CR>
    nnoremap <Leader>td :tabclose!<CR>
    nnoremap <leader>tc :tabnew<CR>
"-----------------------------------------------------------------
" window control
"-----------------------------------------------------------------
    nnoremap <Leader>s :split<CR>
    nnoremap <Leader>v :vsplit<CR>
    nnoremap <C-l> <C-w>L
    nnoremap <C-h> <C-w>H
    nnoremap <C-j> <C-w>J
    nnoremap <C-k> <C-w>K
    nnoremap <C-w>, 10<C-w><
    nnoremap <C-w>. 10<C-w>>
    nnoremap <C-w>= 10<C-w>+
    nnoremap <C-w>- 10<C-w>-
"-----------------------------------------------------------------
" miscellaneous
"-----------------------------------------------------------------
    nnoremap gw "ddiWdwEa<space><esc>"dp
    nnoremap <silent><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
    nnoremap <expr> gpv '`['.strpart(getregtype(), 0, 1).'`]'
    nmap <F12> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files ;<CR>
      \:!cscope -b -i cscope.files -f cscope.out<CR>
      \:cs kill -1<CR>:cs add cscope.out<CR>
      \:!rm cscope.files<CR>
    cmap <C-f> <C-f>h:call <SID>GetCmdHis()<CR>
        function! s:GetCmdHis()
            let @/ = getline('.')
            normal! NN
        endfunction
    nnoremap <C-y> :call <SID>SpellCorrect()<CR>
        function! s:SpellCorrect()
            let s:oldspell = &spell
            set spell
            normal! 1z=
            let &spell = s:oldspell
            unlet s:oldspell
        endfunction
"-----------------------------------------------------------------
" Selection
"-----------------------------------------------------------------
    function! GetVisualSelection()
        let [s:lnum1, s:col1] = getpos("'<")[1:2]
        let [s:lnum2, s:col2] = getpos("'>")[1:2]
        let s:lines = getline(s:lnum1, s:lnum2)
        let s:lines[-1] = s:lines[-1][: s:col2 - (&selection == 'inclusive' ? 1 : 2)]
        let s:lines[0] = s:lines[0][s:col1 - 1:]
        return join(s:lines, ' ')
    endfunction
"-----------------------------------------------------------------
" movement
"-----------------------------------------------------------------
    inoremap <C-b> <esc>Bi
    inoremap <C-f> <esc>eWi

    nnoremap k gk
    nnoremap j gj
    nnoremap gk k
    nnoremap gj j

    vnoremap k gk
    vnoremap j gj
    vnoremap gk k
    vnoremap gj j
"-----------------------------------------------------------------
" search&replace
"-----------------------------------------------------------------
    " nnoremap / /\v  " auto very magic
    " nnoremap ? ?\v
    nnoremap 'r :%s:::gc<Left><Left><Left><Left>
    nnoremap 'g :%g::<Left><Left><Left><Left>
    cnoremap '\ \(\)<Left><Left>
"-----------------------------------------------------------------
" commands
"-----------------------------------------------------------------
    command! -complete=file -nargs=1 Rjpg :read !jp2a <q-args>
    command! EclimCleanUp :!rm -f __eclim_temp_*
    command! Xopen :!xdg-open % &
    command! VShell :set noautochdir | VimShell
    command! CtagsUpdate :cd ~/.vim | execute '!ctags -R '.$PWD
    command! SourceBeautify :execute "normal! Gma:read\ !js-beautify\ %\<CR>`adgg"
    command! AppendModeLine :call AppendModeline()
        function! AppendModeline()
            let l:ml= " vim:ts=".&tabstop.":sw=".&shiftwidth.":tw=".&textwidth.":ft=".&filetype.":fdm=".&foldmethod.":fdl=".&foldlevel
            let l:ml= substitute(&commentstring, "%s", l:ml, "")
            call append(line("$"), l:ml)
        endfunction
    command! -range PluginConfig :'<,'>call PluginAddComment()
        function! PluginAddComment() range
            let lines = getline(a:firstline, a:lastline)
            exec 'e ~/.vim/config/GlobalVariables.vim'
            for line in lines
                call s:add_commont(line)
            endfor
        endfunction

        function! s:add_commont(line)
            let line = a:line
            if line =~? '^\s*NeoBundle.*$'
                let arg = matchstr(line, "'".'\zs[^'."'".']*\ze'."'").matchstr(line,'"\zs[^"]*\ze"')
                call s:parse_name(arg)
                global/====/nohlsearch
                exec 'call append('.line('.').",'".'"--------------------------------------------------------------------------------------------------------------'."')"
                exec 'call append('.line('.').",'".'" '.s:uri."')"
                exec 'call append('.line('.').",'".'" plugin - '.s:name."')"
                exec 'call append('.line('.').",'".'"--------------------------------------------------------------------------------------------------------------'."')"
            endif
        endfunction

        function! s:parse_name(arg)
            let arg = a:arg
            let git_proto = exists('g:vundle_default_git_proto') ? g:vundle_default_git_proto : 'https'
            if    arg =~? '^\s*\(gh\|github\):\S\+'
            \  || arg =~? '^[a-z0-9][a-z0-9-]*/[^/]\+$'
                let uri = git_proto.'://github.com/'.split(arg, ':')[-1]
                if uri !~? '\.git$'
                let uri .= '.git'
                endif
                let name = substitute(split(uri,'\/')[-1], '\.git\s*$','','i')
            elseif arg =~? '^\s*\(git@\|git://\)\S\+'
            \   || arg =~? '\(file\|https\?\)://'
            \   || arg =~? '\.git\s*$'
                let uri = arg
                let name = split( substitute(uri,'/\?\.git\s*$','','i') ,'\/')[-1]
            else
                let name = arg
                let uri  = git_proto.'://github.com/vim-scripts/'.name.'.git'
            endif
            let s:name = name
            let s:uri = uri
        endfunction
    command! TrimSpaces :call TrimSpaces()
        function! TrimSpaces()
            %s/\s\+$//gec
            normal ``
        endfunction
    command! OpenUrl call OpenUrlUnderCursor()
        function! OpenUrlUnderCursor()
            execute "normal BvEy"
            let url=matchstr(@0, '[a-z]*:\/\/[^ >,;]*')
            if url != ""
                silent exec "!xdg-open ".url | redraw!
            else
                echo "No URL under cursor."
            endif
        endfunction
"-----------------------------------------------------------------
" alias
"-----------------------------------------------------------------
    cnoreabbrev <expr> bu
    \ ((getcmdtype() == ':' && getcmdpos() <= 3)? 'Unite neobundle/update'   : 'bu')
    cnoreabbrev <expr> bl
    \ ((getcmdtype() == ':' && getcmdpos() <= 3)? 'Unite neobundle'     : 'bl')
    cnoreabbrev <expr> bi
    \ ((getcmdtype() == ':' && getcmdpos() <= 3)? 'Unite neobundle/install'  : 'bi')
    cnoreabbrev <expr> bc
    \ ((getcmdtype() == ':' && getcmdpos() <= 3)? 'NeoBundleClean'    : 'bc')
    cnoreabbrev <expr> cg
    \ ((getcmdtype() == ':' && getcmdpos() <= 3)? 'cscope find g'    : 'cg')
    cnoreabbrev <expr> cs
    \ ((getcmdtype() == ':' && getcmdpos() <= 3)? 'cscope find s'    : 'cs')
    cnoreabbrev <expr> was
    \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'w\|so %'        : 'was')

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
