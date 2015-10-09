" Setup NeoBundle
filetype off
if has('vim_starting')
    set nocompatible
    if has('win32') || has('win64')
        set shellslash
        let $DOTVIM = expand('~/vimfiles')
    else
        let $DOTVIM = expand('~/.vim')
    endif

    set rtp+=$DOTVIM/bundle/neobundle.vim

    let g:neobundle#types#git#default_protocol='git'
endif

function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

call neobundle#begin(expand('$DOTVIM/bundle'))

" Plugins on GitHub
NeoBundleFetch 'Shougo/neobundle.vim'
if s:meet_neocomplete_requirements()
NeoBundle 'Shougo/neocomplete'
else
NeoBundle 'Shougo/neocomplcache'
endif
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimproc', {
    \'build' : {
    \   'windows': 'echo "Sorry, cannot update vimproc binary file in Windows."',
    \   'cygwin' : 'make -f make_cygwin.mak',
    \   'mac'    : 'make -f make_mac.mak',
    \   'unix'   : 'make -f make_unix.mak',
    \ },
\ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundleLazy 'mattn/emmet-vim', {
    \   'autoload': { 'filetypes': [ 'html' ] },
\ }
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'moll/vim-node'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundleLazy 'jelera/vim-javascript-syntax', {
    \   'autoload': { 'filename_patterns': [ '.*\.js' ] },
\ }
NeoBundle 'othree/html5.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kana/vim-altr'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-gf-diff'
NeoBundle 'cohama/vim-smartinput-endwise'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'taku-o/vim-vis'
NeoBundle 'csexton/trailertrash.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'pasela/unite-webcolorname'
if has('python')
NeoBundleLazy 'tokorom/clang_complete', {
    \   'autoload': { 'filetypes': [ 'c', 'cpp', 'objc', 'objcpp' ] },
\ }
NeoBundleLazy 'tokorom/cocoa.vim', 'syntax-only', {
    \   'autoload': { 'filetypes': [ 'objc', 'objcpp' ] },
\ }
if has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin'
NeoBundleLazy 'tokorom/clang_complete-getopts-ios', {
    \   'autoload': { 'filetypes': [ 'objc', 'objcpp' ] },
\ }
endif
endif
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'mbbill/undotree'
NeoBundle 'tikhomirov/vim-glsl'
NeoBundle 'rainux/vim-desert-warm-256'
NeoBundleLazy 'heavenshell/vim-jsdoc', {
    \   'autoload': { 'filename_patterns': [ '.*\.js' ] },
\ }
NeoBundle 'koron/codic-vim'
NeoBundle 'rhysd/unite-codic.vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundleLazy 'hynek/vim-python-pep8-indent', {
    \ "autoload": {"insert": 1, "filetypes": ["python", "python3", "djangohtml"]}
\ }
NeoBundle 'gnperdue/vim-asciidoc'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'mrk21/yaml-vim', {
    \   'autoload': { 'filetypes': [ 'yaml' ] },
\ }
NeoBundle 'elzr/vim-json'
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'rust-lang/rust.vim'
if executable('nginx')
    NeoBundleLazy 'evanmiller/nginx-vim-syntax', {
        \ 'autoload': {'filetypes': 'nginx'}
    \ }
endif

" Plugins on vim-scripts
NeoBundle 'desert256.vim'
NeoBundle 'sudo.vim'
NeoBundle 'svn-diff.vim'
NeoBundle 'surround.vim'
NeoBundle 'php-doc-upgrade'
NeoBundle 'confluencewiki.vim'
NeoBundle 'digitaltoad/vim-jade'

call neobundle#end()

syntax enable
filetype plugin indent on

if !has('gui_running')
NeoBundleCheck
endif

set number
set ruler
set cursorline
set showcmd
set showmode
set viminfo+=h

set nobackup
set writebackup
set noundofile

set visualbell t_vb=
set noerrorbells

set expandtab
set autoindent
set copyindent
set preserveindent
set smartindent
set showmatch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set listchars=tab:^\ ,trail:_
set list
set wildmode=list:longest,full

set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>

set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set scrolloff=5
set virtualedit=block

set pumheight=10

set nrformats=alpha,octal,hex

map gf <C-w>gf

noremap j gj
noremap k gk
noremap gj j
noremap gk k
" quick resize
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap ) <C-w>>
nnoremap ( <C-w><
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
nnoremap tn :<C-u>tabn<CR>
nnoremap tp :<C-u>tabp<CR>
nnoremap <CR> o<Esc>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" quick edit $MYVIMRC
nnoremap <silent> <Space>.  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>s. :<C-u>source $MYVIMRC<CR>
" quick help
nnoremap H  :<C-u>help<Space>
nnoremap th :<C-u>tab help<Space>
" toggle <sp>ell
nnoremap <silent> <Space>sp :<C-u>setlocal spell! spelllang=en_us<CR>:setlocal spell?<CR>
" toggle header file(vim-altr)
nmap <Space>a <Plug>(altr-forward)

inoremap <expr> ,df strftime('%Y-%m-%dT%H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <Del>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
" default escape for search. naked input: <C-v>/, <C-v>?
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" quick select last modified
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>

vnoremap < <gv
vnoremap > >gv
" quick continuous paste
vnoremap <silent> <C-p> "0p<CR>
" require Python 2.6+
vnoremap _json !python -m json.tool<CR>

command! Cp932     edit ++enc=cp932<CR>
command! Eucjp     edit ++enc=euc-jp<CR>
command! Iso2022jp edit ++enc=iso2022jp<CR>
command! Utf8      edit ++enc=utf-8<CR>
command! Jis       Iso2022jp
command! Sjis      Cp932

" neocomplcache
if s:meet_neocomplete_requirements()
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_underbar_completion = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#min_keyword_length = 3
else
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_min_keyword_length = 3
endif

" clang_complete
let s:hooks = neobundle#get_hooks("clang_complete")
function! s:hooks.on_source(bundle)

if s:meet_neocomplete_requirements()
    let g:neocomplete#force_overwrite_completefunc = 1
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#force_omni_input_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#force_omni_input_patterns.javascript =
      \ '[^. \t]\.\w*'
else
    let g:neocomplcache_force_overwrite_completefunc = 1
    if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.javascript =
      \ '[^. \t]\.\w*'
endif
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

endfunction

" clang_complete-getopts-ios
let s:hooks = neobundle#get_hooks("clang_complete-getopts-ios")
function! s:hooks.on_source(bundle)

let g:clang_complete_getopts_ios_sdk_directory = '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk'
let g:clang_complete_getopts_ios_ignore_directories = ["^\.git", "\.xcodeproj"]

endfunction

" sonictemplate-vim
let g:sonictemplate_vim_template_dir = '$HOME/.vim/template'

" emmet-vim
let g:user_emmet_settings = {
  \'indentation': '  ',
  \}

" lightline
set laststatus=2
if has('unix') && !has('gui_running')
    inoremap <silent> <Esc> <Esc>
    inoremap <silent> <C-[> <Esc>
endif
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \   'active': {
  \     'left': [
  \       [ 'mode', 'paste', ],
  \       [ 'fugitive', 'readonly', 'filename', ],
  \     ]
  \   },
  \   'component_function': {
  \     'fugitive': 'MyFugitive',
  \     'filename': 'MyFilename',
  \   },
  \ }

function! MyFugitive()
    return exists('*fugitive#head') && strlen(fugitive#head()) ? fugitive#head() : ''
endfunction

function! MyFilename()
    return ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

" vim-smartchr
function! EnableSmartchrBasic()
    inoremap <buffer><expr> + smartchr#one_of(' + ', '+', '++')
    inoremap <buffer><expr> - smartchr#one_of(' - ', ' -- ', '-')
    inoremap <buffer><expr> & smartchr#one_of(' & ', ' && ', '&')
    inoremap <buffer><expr> / smartchr#one_of('/', '// ', '/')
    inoremap <buffer><expr> , smartchr#one_of(', ', ',')
    inoremap <buffer><expr> : smartchr#one_of(': ', ':')
    inoremap <buffer><expr> % smartchr#one_of(' % ', '%')
    inoremap <buffer><expr> <Bar> smartchr#one_of('<Bar>', ' <Bar><Bar> ', '<Bar>')
    inoremap <buffer><expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= ' : search('\(\*\<bar>!\)\%#')? '= ' : smartchr#one_of(' = ', ' == ', '=')
endfunction

function! EnableSmartchrExtendComparison()
    inoremap <buffer><expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= ' : search('\(\*\<bar>!\)\%#')? '= ' : smartchr#one_of(' = ', ' == ', ' === ', '=')
endfunction

function! DisableSmartchr()
    inoremap <buffer> + +
    inoremap <buffer> - -
    inoremap <buffer> & &
    inoremap <buffer> / /
    inoremap <buffer> , ,
    inoremap <buffer> : :
    inoremap <buffer> % %
    inoremap <buffer> <Bar> <Bar>
    inoremap <buffer> = =
endfunction

" vim-smartinput
if exists('smartinput#define_rule')
    call smartinput#define_rule({
    \   'at': '\s\+\%#',
    \   'char': '<CR>',
    \   'input': "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",
    \   })
endif

" vim-smartinput-endwise
if exists('smartinput_endwise')
    call smartinput_endwise#define_default_rules()
endif

" syntastic
let g:syntastic_auto_jump = 1
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" yankround.vim
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" unite.vim
let g:unite_enable_start_insert = 1
nnoremap <silent> ss :<C-u>UniteWithBufferDir -buffer-name=files buffer file_rec file file_mru<CR>
let g:unite_source_menu_menus = {
\   "shortcut" : {
\       "description" : "shortcuts",
\       "command_candidates" : [
\           ["unite-outline", "Unite outline"],
\           ["unite-codic", "Unite codic"],
\           ["unite-file_mru", "Unite file_mru"],
\           ["unite-history/command", "Unite history/command"],
\           ["unite-history/search",  "Unite history/search"],
\           ["unite-yankround",    "Unite yankround"],
\           ["edit vimrc", "edit $MYVIMRC"],
\           ["unite-webcolorname", "Unite webcolorname"],
\       ],
\   },
\}

" vim-ref
let g:ref_alc_start_linenumber = 41
nnoremap ,alc :<C-u>Ref alc<Space>

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0

" vim-alignta
xnoremap <silent> L :Alignta << =<CR>
xnoremap <silent> R :Alignta >> =<CR>

" vim-quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" vim-json
let g:vim_json_syntax_conceal = 0

" cursor style
function! HighlightCursor()
    hi CursorColumn gui=NONE guifg=NONE guibg=Grey40 cterm=NONE ctermfg=NONE ctermbg=241
    hi CursorLine gui=NONE guifg=NONE guibg=Grey40 cterm=NONE ctermfg=NONE ctermbg=241
    hi Cursor guifg=Black guibg=Lavender cterm=reverse ctermfg=NONE ctermbg=NONE
    hi lCursor guifg=Black guibg=Lavender cterm=reverse ctermfg=NONE ctermbg=NONE
endfunction

augroup MyAutoCmd
    autocmd!
    " highlight cursor
    autocmd ColorScheme * call HighlightCursor()
    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
    " highlight two-byte spaces
    autocmd ColorScheme * hi link TwoByteSpace Error
    autocmd VimEnter,WinEnter * let w:m_tbs = matchadd("TwoByteSpace", '　')
    " vim-indent-guides color
    autocmd ColorScheme * hi IndentGuidesOdd  ctermbg=237
    autocmd ColorScheme * hi IndentGuidesEven ctermbg=236
    " restore cursor
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    " switch smartchr
    autocmd FileType c,cpp,cs,glsl,java,javascript,php,python,ruby,coffee,vim call EnableSmartchrBasic()
    autocmd FileType php,javascript call EnableSmartchrExtendComparison()
    autocmd FileType objc,objcpp,text,markdown,html,xml call DisableSmartchr()
    " from :help smartindent
    autocmd FileType python :inoremap # X#
    " for commit log
    autocmd FileType svn,gitcommit,gitrebase setlocal spell spelllang=en_us fileencoding=utf-8
    " for Makefile
    autocmd FileType make setlocal noexpandtab
    " for javascript completion
    autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
augroup END

" markdown highlighting
let g:markdown_fenced_languages = [
    \   'bash=sh',
    \   'c',
    \   'coffee',
    \   'cpp',
    \   'cs',
    \   'css',
    \   'diff',
    \   'html',
    \   'java',
    \   'javascript',
    \   'json',
    \   'make',
    \   'objc',
    \   'python',
    \   'ruby',
    \   'sass',
    \   'sh',
    \   'swift',
    \   'vim',
    \   'xml',
    \   'zsh',
    \ ]

" colorscheme setting
set t_Co=256
try
    colorscheme desert-warm-256
catch  /E185:/
    colorscheme desert
endtry

set termencoding=utf-8
" via http://www.kawaz.jp/pukiwiki/?vim
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

" via http://ttssh2.sourceforge.jp/manual/ja/usage/tips/vim.html
" paste sequence
if &term =~ "xterm"
    " from .screenrc 'term xterm-256color'
    if &term == "xterm-256color" && $SHLVL > 1
        let &t_SI = &t_SI . "\eP\e[?2004h\e\\"
        let &t_EI = "\eP\e[?2004l\e\\" . &t_EI
        let &pastetoggle = "\e[201~"
    else
        let &t_SI .= &t_SI . "\e[?2004h"
        let &t_EI .= "\e[?2004l" . &t_EI
        let &pastetoggle = "\e[201~"
    endif

    function! XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
