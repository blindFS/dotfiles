"--------------------------------------------------------------------------------------------------------------
" plugin - vim-textobj-user      user defined textobj
" https://github.com/kana/vim-textobj-user.git
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - echofunc              function parameter
" https://github.com/mbbill/echofunc.git
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-dispatch          fast build
" https://github.com/tpope/vim-dispatch.git
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-afterimage        ico,png,gif,doc,pdf
" https://github.com/tpope/vim-afterimage.git
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - delimitMate           auto pair
" https://github.com/Raimondi/delimitMate
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - align                 line up text
" https://github.com/vim-scripts/align
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - abolish               sustitution enhance
" https://github.com/tpope/vim-abolish
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-multiple-cursors  multiple cursors edit like sublime
" https://github.com/terryma/vim-multiple-cursors
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - vimux                 interact with tmux from vim
" https://github.com/benmills/vimux
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-surround
" https://github.com/tpope/vim-surround.git
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - tComment
" https://github.com/vim-scripts/tComment.git
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - eclim                 eclipse port
" http://eclim.org/gettingstarted.html
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - clewn                 gdb integration
" http://clewn.sourceforge.net/
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - renumber.vim
" https://github.com/vim-scripts/renumber.vim.git
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - DrawIt
" https://github.com/vim-scripts/DrawIt.git
"--------------------------------------------------------------------------------------------------------------
"==============================================================================================================
"--------------------------------------------------------------------------------------------------------------
" plugin - bclose.vim
" https://github.com/farseer90718/bclose.vim.git
"--------------------------------------------------------------------------------------------------------------
    vmap  <expr>  <leader>h  DVB_Drag('left')
    vmap  <expr>  <leader>j  DVB_Drag('down')
    vmap  <expr>  <leader>k  DVB_Drag('up')
    vmap  <expr>  <leader>l  DVB_Drag('right')
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-reveal
" https://github.com/farseer90718/vim-reveal.git
"--------------------------------------------------------------------------------------------------------------
    let g:reveal_root_path      = $HOME.'/workspace/html/demo/reveal.js'
    let g:reveal_default_config = {
                \'author' : '"farseer"',
                \'description' : '"This presentation is generated by vim-reveal."',
                \'fname' : 'reveal'
                \}
"--------------------------------------------------------------------------------------------------------------
" plugin - NrrwRgn
" https://github.com/chrisbra/NrrwRgn.git
"--------------------------------------------------------------------------------------------------------------
    let g:nrrw_rgn_vert = 1
    let g:nrrw_rgn_wdth = 80
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-markdown
" https://github.com/plasticboy/vim-markdown.git
"--------------------------------------------------------------------------------------------------------------
    let g:vim_markdown_initial_foldlevel=99
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-regionsyntax
" https://github.com/farseer90718/vim-regionsyntax.git
"--------------------------------------------------------------------------------------------------------------
    let g:regionsyntax_ft_trans = {'ini' : 'dosini', 'js' : 'javascript'}
"--------------------------------------------------------------------------------------------------------------
" plugin - slimv
" https://bitbucket.org/kovisoft/slimv
"--------------------------------------------------------------------------------------------------------------
    let g:slimv_impl     = 'sbcl'
    let g:paredit_leader = ','
"--------------------------------------------------------------------------------------------------------------
" plugin - gist-vim
" https://github.com/mattn/gist-vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:gist_clip_command              = 'xclip -selection clipboard'
    let g:gist_detect_filetype           = 1
    let g:gist_open_browser_after_post   = 1
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-preview           preview markdown,html,rdoc in browser
" https://github.com/greyblake/vim-preview
"--------------------------------------------------------------------------------------------------------------
    let g:PreviewBrowsers = 'chromium-browser,firefox'
"--------------------------------------------------------------------------------------------------------------
" plugin - sexy_scroller.vim
" https://github.com/joeytwiddle/sexy_scroller.vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:SexyScroller_EasingStyle = 2
    let g:SexyScroller_ScrollTime  = 5
    let g:SexyScroller_MaxTime     = 500
"--------------------------------------------------------------------------------------------------------------
" plugin - syntastic
" https://github.com/scrooloose/syntastic.git
"--------------------------------------------------------------------------------------------------------------
    let g:syntastic_enable_signs   = 1
    let g:syntastic_error_symbol   = '✗'
    let g:syntastic_warning_symbol = '!'
"--------------------------------------------------------------------------------------------------------------
" plugin - vimim
" https://github.com/vimim/vimim.git
"--------------------------------------------------------------------------------------------------------------
    let g:vimim_toggle = "baidu"
"--------------------------------------------------------------------------------------------------------------
" plugin - calendar-vim
" https://github.com/mattn/calendar-vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:vimwiki_CJK_length      = 1
    let g:calendar_diary          = $HOME.'/vimwiki/diary'
    let g:vimwiki_list            = [{'path': $HOME.'/vimwiki/',
                \ 'path_html': $HOME.'/vimwiki/html/',
                \ 'css_name': 'assets/css/style.css',
                \ 'template_path': $HOME.'/vimwiki/templates',
                \ 'template_default': 'def_template',
                \ 'template_ext': '.html'}]
    let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,table,tr,th,td,p,span'
    let g:vimwiki_code_syntax_map = {'lisp': 'cl'}
"--------------------------------------------------------------------------------------------------------------
" plugin - colorizer             color highlight
" https://github.com/lilydjwg/colorizer.git
"--------------------------------------------------------------------------------------------------------------
    nnoremap <F8> :ColorToggle<CR>
    let g:colorizer_nomap   = 1
    let g:colorizer_startup = 0
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-signify
" https://github.com/mhinz/vim-signify.git
"--------------------------------------------------------------------------------------------------------------
    let g:signify_mapping_next_hunk        = '<leader>gj'
    let g:signify_mapping_prev_hunk        = '<leader>gk'
    let g:signify_mapping_toggle_highlight = '<leader><F9>'
    let g:signify_mapping_toggle           = '<F9>'
    let g:signify_disable_by_default       = 0
    let g:signify_sign_add                 = '✚'
    let g:signify_sign_change              = '✶'
    let g:signify_sign_delete              = '✖'
    let g:signify_sign_delete_first_line   = '✕'
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-easytags
" https://github.com/xolox/vim-easytags.git
"--------------------------------------------------------------------------------------------------------------
    let g:easytags_file            = $HOME.'/.vim/tags'
    let g:easytags_updatetime_min  = 3000
    let g:easytags_updatetime_warn = 0
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-airline
" https://github.com/bling/vim-airline.git
"--------------------------------------------------------------------------------------------------------------
    let g:airline_theme                               = has('gui_running')? 'bubblegum' : 'solarized'
    let g:airline_left_sep                            = '⮀'
    let g:airline_left_alt_sep                        = '⮁'
    let g:airline_right_sep                           = '⮂'
    let g:airline_right_alt_sep                       = '⮃'
    let g:airline#extensions#tabline#left_sep         = '⮀'
    let g:airline#extensions#tabline#left_alt_sep     = '⮁'
    let g:airline#extensions#tabline#right_sep        = '⮂'
    let g:airline#extensions#tabline#right_alt_sep    = '⮃'
    let g:airline_branch_prefix                       = '⭠ '
    let g:airline_readonly_symbol                     = ' ⭤ '
    let g:airline_linecolumn_prefix                   = '⮃ ⭡ '
    let g:airline_paste_symbol                        = '⮁ ✍  PASTE'
    let g:airline#extensions#whitespace#symbol        = '✷'
    let g:airline#extensions#whitespace#show_message  = 0
    let g:airline#extensions#eclim#enabled            = 0
    let g:airline#extensions#hunks#non_zero_only      = 1
    let g:airline#extensions#tabline#enabled          = 1
    let g:airline#extensions#tabline#show_buffers     = 1
    let g:airline#extensions#tabline#fnamemod         = ':t'
    let g:airline#extensions#tabline#buffer_min_count = 2
"--------------------------------------------------------------------------------------------------------------
" plugin - unite                 search for information from arbitrary sources
" https://github.com/Shougo/unite.vim
"--------------------------------------------------------------------------------------------------------------
    let g:unite_enable_ignore_case         = 1
    let g:unite_enable_smart_case          = 1
    let g:unite_enable_start_insert        = 1
    let g:unite_source_history_yank_enable = 1
    let g:unite_winheight                  = 10
    let g:unite_split_rule                 = 'botright'
    let g:unite_cursor_line_highlight      = 'Statusline'
    let g:unite_prompt                     = '➤ '
    let g:unite_data_directory             = $HOME.'/tmp/unite'
    command!  Mru :Unite file_mru
    command!  Uhelp :Unite help
    nnoremap <leader><space>b :Unite buffer<CR>
    nnoremap <leader><space>c :Unite command<CR>
    nnoremap <leader><space>f :Unite file<CR>
    nnoremap <leader><space>j :Unite jump<CR>
    nnoremap <leader><space>l :Unite locate<CR>
    nnoremap <leader><space>m :Unite mark<CR>
    nnoremap <leader><space>t :Unite tag<CR>
    nnoremap <leader><space>u :Unite source<CR>
    nnoremap <leader><space>y :Unite history/yank<CR>
    nnoremap <leader><space>/ :Unite grep:.<CR>
"--------------------------------------------------------------------------------------------------------------
" plugin - vimfiler.vim
" https://github.com/Shougo/vimfiler.vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_tree_leaf_icon      = ' '
    let g:vimfiler_tree_opened_icon    = '▾'
    let g:vimfiler_tree_closed_icon    = '▸'
    let g:vimfiler_file_icon           = '-'
    let g:vimfiler_marked_file_icon    = '*'
    let g:vimfiler_ignore_pattern      = '^\%(.git\|.DS_Store\)$'
    let g:vimfiler_data_directory      = $HOME.'/tmp/vimfiler'
    nnoremap <F2> :VimFilerExplorer<CR>
"--------------------------------------------------------------------------------------------------------------
" plugin - vimshell.vim
" https://github.com/Shougo/vimshell.vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:vimshell_enable_smart_case   = 1
    let g:vimshell_prompt              = '➤  '
    let g:vimshell_user_prompt         = 'fnamemodify(getcwd(), ":~")'
    let g:vimshell_right_prompt        = 'system("date")'
    let g:vimshell_temporary_directory = $HOME."/tmp/vimshell"
"--------------------------------------------------------------------------------------------------------------
" plugin - startify              customize vim startup buffer
" https://github.com/mhinz/vim-startify
"--------------------------------------------------------------------------------------------------------------
    let g:startify_bookmarks     = [ '~/.vimrc','~/.zshrc','~/.vim/config','~/vimwiki/' ]
    let g:startify_custom_header = map(split(system("toilet -f pagga vim7.4 | cowsay -d -f cowfee"), '\n'), '"   ". v:val') + ['','']
    let g:startify_skiplist      = [
        \ 'COMMIT_EDITMSG',
        \ $VIMRUNTIME .'/doc',
        \ 'bundle/.*/doc'
        \ ]
"--------------------------------------------------------------------------------------------------------------
" plugin – emmet.vim             zencoding
" https://github.com/mattn/emmet-vim
"--------------------------------------------------------------------------------------------------------------
    let g:user_emmet_mode       = 'a'
    let g:user_emmet_leader_key = '<c-e>'
"--------------------------------------------------------------------------------------------------------------
" plugin - Solarized             Colorscheme
"--------------------------------------------------------------------------------------------------------------
    let g:solarized_bold       = 1
    let g:solarized_italic     = 1
    let g:solarized_termcolors = 256
    let g:solarized_termtrans  = 1
    let g:solarized_degrade    = 0
"--------------------------------------------------------------------------------------------------------------
" plugin - python-mode           python IDE
" https://github.com/klen/python-mode
"--------------------------------------------------------------------------------------------------------------
    let g:pymode_lint = 0 " disable pymode_lint syntax check because I have syntastic installed
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-translator        google translator
"--------------------------------------------------------------------------------------------------------------
    let g:goog_user_conf = {
        \'langpair': 'en|zh',
        \'cmd': 'node',
        \'v_key': 'T',
        \'r_key': 'L',
        \'s_key': 'O'
        \}
"--------------------------------------------------------------------------------------------------------------
" plugin - easymotion            cursor fast movement
" \\w
"--------------------------------------------------------------------------------------------------------------
    let g:EasyMotion_leader_key = '<Leader><leader>'
"--------------------------------------------------------------------------------------------------------------
" plugin - evervim               evernote
"--------------------------------------------------------------------------------------------------------------
    let g:evervim_devtoken  = 'S=s60:U=69ad3c:E=145034d793a:C=13dab9c4d3a:P=1cd:A=en-devtoken:V=2:H=978aa1dba36a45ef7e881a08891ff63f'
    let g:evervim_xmlindent = $HOME.'/tmp/.evervim'
"--------------------------------------------------------------------------------------------------------------
" plugin - CtrlP                 file searching
" https://github.com/kien/ctrlp.vim
" ? for mapping help
"--------------------------------------------------------------------------------------------------------------
    let g:ctrlp_map                 = '<C-space>'
    let g:ctrlp_cmd                 = 'CtrlP'
    let g:ctrlp_show_hidden         = 1
    let g:ctrlp_use_caching         = 1
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_cache_dir           = $HOME.'/tmp/ctrlp'
    set wildignore+=*/.cache/*,*/tmp/*,*/.git/*,*/.neocon/*,*.log,*.so,*.swp,*.zip,*.gz,*.bz2,*.bmp,*.ppt
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.dll
"--------------------------------------------------------------------------------------------------------------
" plugin - Gundo                 graphic undo tree
" http://sjl.bitbucket.org/gundo.vim/
"--------------------------------------------------------------------------------------------------------------
    noremap <F3> :GundoToggle<CR>
    let g:gundo_right        = 1
    let g:gundo_auto_preview = 1
"--------------------------------------------------------------------------------------------------------------
" plugin - rainbow parentheses   colorful parentheses
"--------------------------------------------------------------------------------------------------------------
    let g:rainbow_active          = 1
    let g:rainbow_load_separately = [
    \   [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \   [ 'tex' , [['(', ')'], ['\[', '\]']] ],
    \   [ 'lisp' , [] ],
    \   [ 'html' , [] ],
    \   [ 'css' , [] ],
    \   [ 'markdown', [] ],
    \   [ 'vimwiki', [] ],
    \   ]
    let g:lisp_rainbow            = 1
    nnoremap <F10> :Rainbow<CR>
"--------------------------------------------------------------------------------------------------------------
" plugin - mark.vim              mark words using beautiful colors
" \m  mark or unmark the word under (or before) the cursor
" \r  manually input a regular expression.for search
" \n  clear this mark (i.e. the mark under the cursor), or clear all
" \*  next same mark \#  previous same mark
" \/  next mark \? previous mark
"--------------------------------------------------------------------------------------------------------------
    let g:mwIgnoreCase                 = 1
    let g:mwAutoLoadMarks              = 1
    let g:mwDefaultHighlightingPalette = 'maximum'
    let g:mwDefaultHighlightingNum     = 20
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-latex-live-preview
" https://github.com/xuhdev/vim-latex-live-preview.git
"--------------------------------------------------------------------------------------------------------------
    let g:livepreview_previewer = 'evince'
    command! LaTeXPreview :LLPStartPreview
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-latex-suite
" https://github.com/gerw/vim-latex-suite.git
"--------------------------------------------------------------------------------------------------------------
    let g:tex_flavor              = 'latex'
    let g:Tex_DefaultTargetFormat = "pdf"
    let g:Tex_AutoFolding         = 0
"--------------------------------------------------------------------------------------------------------------
" plugin - indentGuides          visualize indent
"--------------------------------------------------------------------------------------------------------------
    " autocmd VimEnter,Colorscheme * hi IndentGuidesOdd  guibg = darkyellow ctermbg = darkyellow
    " autocmd VimEnter,Colorscheme * hi IndentGuidesEven guibg = darkblue ctermbg   = darkblue
    let g:indent_guides_auto_colors           = 1
    let g:indent_guides_start_level           = 1
    let g:indent_guides_guide_size            = 1
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_exclude_filetypes     = ['w3m', 'help', 'tagbar', 'unite', 'vimfiler', 'startify', 'taskwarrior']
"--------------------------------------------------------------------------------------------------------------
" plugin - taghighlight          highlight ctags
" http://www.cgtk.co.uk/vim-scripts/taghighlight
"--------------------------------------------------------------------------------------------------------------
    let g:TagHighlightSettings = {}
    let g:TagHighlightSettings['LanguageDetectionMethods'] =
        \ ['Extension', 'FileType']
    let g:TagHighlightSettings['FileTypeLanguageOverrides'] =
        \ {'tagbar': 'c'}
"--------------------------------------------------------------------------------------------------------------
" plugin - Tagbar                taglist alternative
" https://github.com/majutsushi/tagbar
"--------------------------------------------------------------------------------------------------------------
    noremap <F1> :TagbarToggle<CR>
    inoremap <F1> <ESC>:TagbarToggle<CR>
    let g:tagbar_type_vimwiki = {
                \ 'ctagstype' : 'wiki',
                \ 'kinds'     : ['h:headers']
                \ }
    let g:tagbar_type_markdown = {
                \ 'ctagstype' : 'md',
                \ 'kinds' : ['h:headings'],
                \ 'sort' : 0,
                \ }
    let g:tagbar_type_html = {
                \ 'ctagstype' : 'html',
                \ 'kinds'     : ['i:ids', 'c:classes']
                \ }
    let g:tagbar_type_css = {
                \ 'ctagstype' : 'css',
                \ 'kinds' : [
                \ 'c:classes',
                \ 'i:ids',
                \ 't:tags',
                \ 'm:media',
                \ 'f:fonts',
                \ 'k:keyframes'
                \ ],
                \ 'sort' : 0,
                \ }
    let g:tagbar_type_tex = {
                \ 'ctagstype' : 'latex',
                \ 'kinds' : [
                \ 'l:labels',
                \ 's:sections',
                \ 'd:definitions',
                \ 'e:environments'
                \ ]
                \ }
    let g:tagbar_type_vhdl = {
                \ 'ctagstype': 'vhdl',
                \ 'kinds' : [
                \ 'd:prototypes',
                \ 'b:package bodies',
                \ 'e:entities',
                \ 'a:architectures',
                \ 't:types',
                \ 'p:processes',
                \ 'f:functions',
                \ 'r:procedures',
                \ 'c:constants',
                \ 'T:subtypes',
                \ 'r:records',
                \ 'C:components',
                \ 'P:packages',
                \ 'l:locals'
                \ ]
                \ }
"--------------------------------------------------------------------------------------------------------------
" Plugin - supertab              use tab to complete
" https://github.com/ervandew/supertab
"--------------------------------------------------------------------------------------------------------------
    let g:SuperTabDefaultCompletionType     = "<C-x><C-u>"
    let g:SuperTabRetainCompletionType      = 2
"--------------------------------------------------------------------------------------------------------------
" plugin - clang-complete        complete for clang
" https://github.com/vim-scripts/clang-complete.git
"--------------------------------------------------------------------------------------------------------------
    let g:clang_complete_pattern = 1
    let g:clang_complete_auto    = 1
    let g:clang_auto_select      = 0
    let g:clang_use_library      = 1
"--------------------------------------------------------------------------------------------------------------
" plugin - neocomplete.vim
" https://github.com/Shougo/neocomplete.vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:neocomplete#disable_auto_complete               = 0
    let g:neocomplete#force_overwrite_completefunc        = 1
    let g:neocomplete#enable_at_startup                   = 1
    let g:neocomplete#enable_ignore_case                  = 1
    let g:neocomplete#enable_fuzzy_completion             = 1
    let g:neocomplete#data_directory                      = $HOME.'/tmp/.neocomplete'
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns       = {}
    endif
    let g:neocomplete#force_omni_input_patterns.c         = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.cpp       = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:neocomplete#force_omni_input_patterns.objc      = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.objcpp    = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"--------------------------------------------------------------------------------------------------------------
" plugin - neosnippet.vim        snippets
" https://github.com/shougo/neosnippet.vim
"--------------------------------------------------------------------------------------------------------------
    " let g:neosnippet#enable_preview = 0
    " set completeopt+=preview
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif
"--------------------------------------------------------------------------------------------------------------
" Web Design configurations
"--------------------------------------------------------------------------------------------------------------
    let g:html_use_css                     = 1 " Tohtml make html using css
    let g:xml_syntax_folding               = 1 " xml folding

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
