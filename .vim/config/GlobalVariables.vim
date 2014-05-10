"--------------------------------------------------------------------------------------------------------------
" plugin - vim-textobj-user      user defined textobj
" https://github.com/kana/vim-textobj-user.git
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
" plugin - vimux                 interact with tmux from vim
" https://github.com/benmills/vimux
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-surround
" https://github.com/tpope/vim-surround.git
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
" plugin - vim2hs
" https://github.com/dag/vim2hs.git
"--------------------------------------------------------------------------------------------------------------
    let g:haskell_conceal_wide         = 1
    let g:haskell_conceal_enumerations = 1
"--------------------------------------------------------------------------------------------------------------
" plugin - ghcmod-vim
" https://github.com/eagletmt/ghcmod-vim.git
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
" plugin - neco-ghc
" https://github.com/eagletmt/neco-ghc.git
"--------------------------------------------------------------------------------------------------------------
    let g:necoghc_enable_detailed_browse = 1
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-ref
" https://github.com/thinca/vim-ref.git
"--------------------------------------------------------------------------------------------------------------
    let g:ref_cache_dir = $HOME.'/tmp/.vim_ref_cache'
    let g:ref_pydoc_cmd = 'pydoc2'
"--------------------------------------------------------------------------------------------------------------
" plugin - wildfire.vim
" https://github.com/gcmt/wildfire.vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:wildfire_objects   = {
        \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ii", "ip"],
        \ "html,xml" : ["at"],
        \ }
    let g:wildfire_fuel_map  = '+'
    let g:wildfire_water_map = '-'
"--------------------------------------------------------------------------------------------------------------
" plugin - gitv
" https://github.com/gregsexton/gitv.git
"--------------------------------------------------------------------------------------------------------------
    let g:Gitv_OpenHorizontal = 0
"--------------------------------------------------------------------------------------------------------------
" plugin - github-issues.vim
" https://github.com/jaxbot/github-issues.vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:github_issues_no_omni = 0
"--------------------------------------------------------------------------------------------------------------
" plugin - tComment
" https://github.com/vim-scripts/tComment.git
"--------------------------------------------------------------------------------------------------------------
    let g:tcommentTextObjectInlineComment = 'im'
"--------------------------------------------------------------------------------------------------------------
" plugin - calendar.vim
" https://github.com/itchyny/calendar.vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:calendar_google_calendar = 1
    let g:calendar_google_task     = 1
    let g:calendar_cache_directory = $HOME.'/tmp/calendar_vim/'
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-multiple-cursors  multiple cursors edit like sublime
" https://github.com/terryma/vim-multiple-cursors
"--------------------------------------------------------------------------------------------------------------
    highlight link multiple_cursors_visual IncSearch
"--------------------------------------------------------------------------------------------------------------
" plugin - eclim                 eclipse port
" http://eclim.org/gettingstarted.html
"--------------------------------------------------------------------------------------------------------------
    let g:EclimJavaCompleteCaseSensitive = 0
    let g:EclimCompletionMethod          = 'omnifunc'
"--------------------------------------------------------------------------------------------------------------
" plugin - wmgraphviz.vim
" https://github.com/wannesm/wmgraphviz.vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:WMGraphviz_output = 'png'
    let g:WMGraphviz_viewer = 'xdg-open'
"--------------------------------------------------------------------------------------------------------------
" plugin - miscellaneous
" https://github.com/farseer90718/miscellaneous.git
"--------------------------------------------------------------------------------------------------------------
    vmap  <expr>  <LEFT>   DVB_Drag('left')
    vmap  <expr>  <RIGHT>  DVB_Drag('right')
    vmap  <expr>  <DOWN>   DVB_Drag('down')
    vmap  <expr>  <UP>     DVB_Drag('up')
"--------------------------------------------------------------------------------------------------------------
" plugin - crunch
" https://github.com/arecarn/crunch.git
"--------------------------------------------------------------------------------------------------------------
    let g:crunch_calc_prompt = '➤  '
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-over
" https://github.com/osyo-manga/vim-over.git
"--------------------------------------------------------------------------------------------------------------
    let g:over_command_line_prompt = '➤  '
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-easy-align
" https://github.com/junegunn/vim-easy-align.git
"--------------------------------------------------------------------------------------------------------------
    vnoremap <silent> <Enter> :EasyAlign<Enter>
    let g:easy_align_delimiters = {
                \ '>': { 'pattern': '>>\|=>\|>' },
                \ '/': { 'pattern': '//\+\|/\*\|\*/', 'ignore_groups': ['String'] },
                \ '#': { 'pattern': '#\+', 'ignore_groups': ['String'], 'delimiter_align': 'l' },
                \ ']': {
                \     'pattern':       '[[\]]',
                \     'left_margin':   0,
                \     'right_margin':  0,
                \     'stick_to_left': 0
                \   },
                \ ')': {
                \     'pattern':       '[()]',
                \     'left_margin':   0,
                \     'right_margin':  0,
                \     'stick_to_left': 0
                \   },
                \ 'd': {
                \     'pattern': ' \(\S\+\s*[;=]\)\@=',
                \     'left_margin': 0,
                \     'right_margin': 0
                \   }
                \ }
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-taskwarrior
" https://github.com/farseer90718/vim-taskwarrior.git
"--------------------------------------------------------------------------------------------------------------
    let g:task_report_name              = 'long'
    let g:task_highlight_field          = 1
    let g:task_field_highlight_advanced = ''
    let g:task_default_prompt           = ['description', 'due', 'priority', 'tag', 'depend']
    " let g:task_rc_override              = ''
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
    let g:reveal_root_path      = $HOME.'/workspace/html/apps/reveal.js'
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
    let g:regionsyntax_ft_trans = {
                \ 'ini' : 'dosini',
                \ 'js' : 'javascript',
                \ 'basemake' : 'make'}
"--------------------------------------------------------------------------------------------------------------
" plugin - slimv
" https://bitbucket.org/kovisoft/slimv
"--------------------------------------------------------------------------------------------------------------
    let g:slimv_impl     = 'sbcl'
    let g:paredit_leader = ','
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-github-dashboard
" https://github.com/junegunn/vim-github-dashboard.git
"--------------------------------------------------------------------------------------------------------------
    let g:github_dashboard = {
                \ 'username': 'farseer90718',
                \ 'api_open_timeout': 10,
                \ 'api_read_timeout': 20,
                \ 'statusline': 0}
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
    let g:PreviewBrowsers = 'google-chrome-stable, firefox'
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
    let g:syntastic_error_symbol   = 'x'
    let g:syntastic_warning_symbol = '!'
    let g:syntastic_tex_checkers   = ['lacheck']
"--------------------------------------------------------------------------------------------------------------
" plugin - YouCompleteMe
" https://github.com/Valloric/YouCompleteMe.git
"--------------------------------------------------------------------------------------------------------------
    let g:ycm_allow_changing_updatetime     = 0
    let g:ycm_register_as_syntastic_checker = 1
    let g:ycm_confirm_extra_conf            = 1
    " let g:ycm_filetype_whitelist            = { 'python': 1, 'cpp': 1, 'c': 1}
    " let g:ycm_global_ycm_extra_conf         = '~/tmp/.ycm_extra_conf_cpp.py'
    let g:ycm_global_ycm_extra_conf         = '~/tmp/.ycm_extra_conf_c.py'
    command! YCMSwitchConf let g:ycm_global_ycm_extra_conf = g:ycm_global_ycm_extra_conf =~ 'cpp' ? '~/tmp/.ycm_extra_conf_c.py' : '~/tmp/.ycm_extra_conf_cpp.py'
"--------------------------------------------------------------------------------------------------------------
" plugin - vimwiki
" https://github.com/vimwiki/vimwiki
"--------------------------------------------------------------------------------------------------------------
    let g:vimwiki_CJK_length      = 1
    let g:calendar_diary          = $HOME.'/Dropbox/vimwiki/diary'
    let g:vimwiki_list            = [{'path': $HOME.'/Dropbox/vimwiki/',
                \ 'path_html': $HOME.'/Dropbox/vimwiki/html/',
                \ 'css_name': 'assets/css/style.css',
                \ 'template_path': $HOME.'/Dropbox/vimwiki/templates',
                \ 'template_default': 'def_template',
                \ 'template_ext': '.html'}]
    let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,table,tr,th,td,p,span'
    let g:vimwiki_code_syntax_map = {
                \ 'lisp' : 'cl',
                \ 'charmpp' : 'c'}
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
    let g:signify_sign_add                 = '+'
    let g:signify_sign_change              = '*'
    let g:signify_sign_delete              = 'x'
    let g:signify_sign_delete_first_line   = 'X'
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
    let g:airline_theme                               = 'lucius'
    let g:airline_left_sep                            = ''
    let g:airline_left_alt_sep                        = ''
    let g:airline_right_sep                           = ''
    let g:airline_right_alt_sep                       = ''
    let g:airline#extensions#tabline#left_sep         = ''
    let g:airline#extensions#tabline#left_alt_sep     = ''
    let g:airline#extensions#tabline#right_sep        = ''
    let g:airline#extensions#tabline#right_alt_sep    = ''
    let g:airline_branch_prefix                       = '  '
    let g:airline_readonly_symbol                     = '  '
    let g:airline_linecolumn_prefix                   = '  '
    let g:airline_paste_symbol                        = ' ✍  PASTE'
    let g:airline#extensions#whitespace#symbol        = '✷'
    let g:airline#extensions#whitespace#show_message  = 0
    let g:airline#extensions#eclim#enabled            = 1
    let g:airline#extensions#hunks#non_zero_only      = 1
    let g:airline#extensions#tabline#enabled          = 1
    let g:airline#extensions#tabline#show_buffers     = 1
    let g:airline#extensions#tabline#buffer_min_count = 2
    let g:airline#extensions#tabline#fnamemod         = ':t'
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
    command!  Uhelp :Unite help
    nnoremap <Leader><space>b :Unite buffer_tab<CR>
    nnoremap <leader><space>B :Unite buffer<CR>
    nnoremap <leader><space>c :Unite command<CR>
    nnoremap <leader><space>f :Unite file<CR>
    nnoremap <leader><space>j :Unite jump<CR>
    nnoremap <leader><space>l :Unite buffer_tab<CR>
    nnoremap <leader><space>m :Unite mark<CR>
    nnoremap <leader><space>o :Unite outline<CR>
    nnoremap <leader><space>p :Unite mapping<CR>
    nnoremap <leader><space>s :Unite source<CR>
    nnoremap <leader><space>t :Unite tag<CR>
    nnoremap <leader><space>y :Unite history/yank<CR>
    nnoremap <leader><space>/ :Unite grep:.<CR>
    nnoremap <leader>gg :execute 'Unite gtags/def:'.expand('<cword>')<CR>
    nnoremap <leader>gc :Unite gtags/context<CR>
    nnoremap <leader>gr :Unite gtags/ref<CR>
    nnoremap <leader>ge :Unite gtags/grep<CR>
    vnoremap <leader>gg <ESC>:execute 'Unite gtags/def:'.GetVisualSelection()<CR>
    highlight default link uniteSource__Gtags_LineNr String
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
    nnoremap <F1> :VimFilerExplorer<CR>
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
    let g:startify_custom_header = map(split(system("toilet -f pagga 42 | cowsay -d -f cowfee"), '\n'), '"   ". v:val') + ['','']
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
" plugin - seoul256.vim
" https://github.com/junegunn/seoul256.vim.git
"--------------------------------------------------------------------------------------------------------------
    let g:seoul256_background = 233
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-translator        google translator
"--------------------------------------------------------------------------------------------------------------
    let g:goog_user_conf = {
        \'langpair': '|zh',
        \'cmd': 'node',
        \'v_key': 'T',
        \'r_key': 'R',
        \'s_key': 'O'
        \}
"--------------------------------------------------------------------------------------------------------------
" plugin - easymotion            cursor fast movement
"--------------------------------------------------------------------------------------------------------------
    let g:EasyMotion_leader_key = '.'
    map f <Plug>(easymotion-f)
    map F <Plug>(easymotion-F)
    map t <Plug>(easymotion-t)
    map T <Plug>(easymotion-T)
"--------------------------------------------------------------------------------------------------------------
" plugin - evervim               evernote
"--------------------------------------------------------------------------------------------------------------
    let g:evervim_devtoken = 'S=s60:U=69ad3c:E=145034d793a:C=13dab9c4d3a:P=1cd:A=en-devtoken:V=2:H=978aa1dba36a45ef7e881a08891ff63f'
    let g:evervim_workdir  = $HOME.'/tmp/.evervim'
"--------------------------------------------------------------------------------------------------------------
" plugin - CtrlP                 file searching
" https://github.com/kien/ctrlp.vim
"--------------------------------------------------------------------------------------------------------------
    let g:ctrlp_map                 = '<C-space>'
    let g:ctrlp_cmd                 = 'CtrlP'
    let g:ctrlp_show_hidden         = 1
    let g:ctrlp_use_caching         = 1
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_cache_dir           = $HOME.'/tmp/ctrlp'
    command!  Mru :CtrlPMRUFiles
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
    let g:mwAutoSaveMarks              = 1
    let g:mwDefaultHighlightingNum     = 20
    let g:mwDefaultHighlightingPalette = 'maximum'
"--------------------------------------------------------------------------------------------------------------
" plugin - vim-latex-suite
" https://github.com/gerw/vim-latex-suite.git
"--------------------------------------------------------------------------------------------------------------
    let g:tex_flavor              = 'latex'
    let g:Tex_DefaultTargetFormat = 'pdf'
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
    let g:indent_guides_exclude_filetypes     = ['w3m', 'help', 'tagbar', 'unite', 'vimfiler', 'startify', 'taskreport', 'calendar']
"--------------------------------------------------------------------------------------------------------------
" plugin - taghighlight          highlight ctags
" http://www.cgtk.co.uk/vim-scripts/taghighlight
"--------------------------------------------------------------------------------------------------------------
    let g:TagHighlightSettings = {}
    let g:TagHighlightSettings['LanguageDetectionMethods'] =
        \ ['Extension', 'FileType']
    let g:TagHighlightSettings['FileTypeLanguageOverrides'] =
        \ {'tagbar': 'c'}
    hi default link Class          String
    hi default link DefinedName    keyword
    hi default link Function       Identifier
    hi default link Enumerator     tag
    hi default link Member         Title
    hi default link Structure      String
    hi default link Type           Todo
    hi default link Union          String
    hi default link GlobalConstant Constant
    hi default link GlobalConstant Variable
    hi default link LocalVariable  Variable
"--------------------------------------------------------------------------------------------------------------
" plugin - Tagbar                taglist alternative
" https://github.com/majutsushi/tagbar
"--------------------------------------------------------------------------------------------------------------
    noremap <F2> :TagbarToggle<CR>
    let g:tagbar_type_vimwiki = {
                \ 'ctagstype' : 'wiki',
                \ 'kinds'     : ['h:headers'],
                \ 'sort'      : 0
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
    let g:tagbar_type_javascript = {
                \ 'ctagstype' : 'javascript',
                \ 'kinds' : [
                \ 'o:object',
                \ 'f:function',
                \ 'a:array',
                \ 's:string',
                \ 'b:boolean',
                \ 'n:number',
                \ 'v:variable',
                \ 'm:member'
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
    if executable('hasktags')
        let g:tagbar_type_haskell = {
                    \ 'ctagsbin'  : 'hasktags',
                    \ 'ctagsargs' : '-x -c -o-',
                    \ 'kinds'     : [
                    \  'm:modules:0:1',
                    \  'd:data: 0:1',
                    \  'd_gadt: data gadt:0:1',
                    \  't:type names:0:1',
                    \  'nt:new types:0:1',
                    \  'c:classes:0:1',
                    \  'cons:constructors:1:1',
                    \  'c_gadt:constructor gadt:1:1',
                    \  'c_a:constructor accessors:1:1',
                    \  'ft:function types:1:1',
                    \  'fi:function implementations:0:1',
                    \  'o:others:0:1'
                    \ ],
                    \ 'sro'        : '.',
                    \ 'kind2scope' : {
                    \ 'm' : 'module',
                    \ 'c' : 'class',
                    \ 'd' : 'data',
                    \ 't' : 'type'
                    \ },
                    \ 'scope2kind' : {
                    \ 'module' : 'm',
                    \ 'class'  : 'c',
                    \ 'data'   : 'd',
                    \ 'type'   : 't'
                    \ }
                    \ }
    endif
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
    noremap <F11> :NeoCompleteToggle<CR>
    let g:neocomplete#disable_auto_complete               = 0
    let g:neocomplete#force_overwrite_completefunc        = 1
    let g:neocomplete#enable_at_startup                   = 1
    let g:neocomplete#enable_ignore_case                  = 1
    let g:neocomplete#enable_fuzzy_completion             = 1
    let g:neocomplete#data_directory                      = $HOME.'/tmp/.neocomplete'
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns       = {}
    endif
    let g:neocomplete#force_omni_input_patterns.python     = '\%([^. \t]\.\|^\s*@\)\w*'
    let g:neocomplete#force_omni_input_patterns.dot        = '\[.*'
    let g:neocomplete#force_omni_input_patterns.c          = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.cpp        = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:neocomplete#force_omni_input_patterns.objc       = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.objcpp     = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"--------------------------------------------------------------------------------------------------------------
" plugin - neosnippet.vim        snippets
" https://github.com/shougo/neosnippet.vim
"--------------------------------------------------------------------------------------------------------------
    " let g:neosnippet#enable_preview = 0
    " set completeopt+=preview
    let g:neosnippet#snippets_directory = $HOME.'/.vim/snippets'
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
