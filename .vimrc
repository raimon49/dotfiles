" Setup dein.vim
scriptencoding utf-8
filetype off
if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    if has('win32') || has('win64')
        set shellslash
        let $DOTVIM = expand('~/vimfiles')
    else
        let $DOTVIM = expand('~/.vim')
    endif

    let s:dein_dir      = expand('$DOTVIM/dein')
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
    if &runtimepath !~# '/dein.vim'
        if !isdirectory(s:dein_repo_dir)
            call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
        endif
        execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
    endif
endif

function! s:has_cjk_spelllang()
    return (v:version > 704 || (v:version == 704 && has('patch092')))
endfunction

function! s:setlocal_spelllang()
    if !has('spell') || !has('syntax')
        return
    endif

    setlocal spelllang=en_us
    if s:has_cjk_spelllang()
        setlocal spelllang+=cjk
    endif

    setlocal spell fileencoding=utf-8
endfunction

function! s:toggle_setting_spell()
    if !has('spell') || !has('syntax')
        echo 'has no spell and syntax'
        return
    endif

    setlocal spelllang=en_us
    if s:has_cjk_spelllang()
        setlocal spelllang+=cjk
    endif

    setlocal spell!
endfunction

function! s:toggle_setting_mouse()
    if !has('mouse')
        echo 'has no mouse'
        return
    endif

    if &mouse == ''
        setlocal mouse=a
    else
        setlocal mouse=
    endif
endfunction

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml = expand('$DOTVIM/dein.toml')
    let s:lazy_toml = expand('$DOTVIM/dein_lazy.toml')

    call dein#load_toml(s:toml, { 'lazy': 0 })
    call dein#load_toml(s:lazy_toml, { 'lazy': 1 })

    call dein#end()
    call dein#save_state()
endif

if filereadable(expand('$VIMRUNTIME/macros/matchit.vim'))
    source $VIMRUNTIME/macros/matchit.vim
endif

let g:dein#types#git#clone_depth = 1
if has('vim_starting') && dein#check_install(['vimproc'])
    call dein#install(['vimproc'])
endif
if has('vim_starting') && dein#check_install()
    call dein#install()
endif

syntax enable
filetype plugin indent on

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

set noequalalways
set winheight=8

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
function! s:move_to_new_tab()
    tab split
    tabprevious

    if winnr('$') > 1
        close
    elseif bufnr('$') > 1
        buffer #
    endif

    tabnext
endfunction
nnoremap <silent> tm :<C-u>call <SID>move_to_new_tab()<CR>
nnoremap tn :<C-u>tabn<CR>
nnoremap tp :<C-u>tabp<CR>
nnoremap <CR> o<Esc>
" quick edit $MYVIMRC
let mapleader = "\<Space>"
nnoremap <silent> <Leader>.  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Leader>s. :<C-u>source $MYVIMRC<CR>
" quick help
nnoremap H  :<C-u>help<Space>
nnoremap th :<C-u>tab help<Space>
set keywordprg=:help " Open Vim internal help by K command
" toggle <sp>ell
noremap <silent> <Leader>sp :<C-u>call <SID>toggle_setting_spell()<CR>
" toggle <mo>use
set mouse=
noremap <silent> <Leader>mo :<C-u>call <SID>toggle_setting_mouse()<CR>
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

" quick select last modified
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>

vnoremap < <gv
vnoremap > >gv
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
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

if dein#tap('neocomplete.vim')
    set completeopt=menuone
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_underbar_completion = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#min_keyword_length = 3
    let g:neocomplete#force_overwrite_completefunc = 1
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#force_omni_input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#force_omni_input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
endif

if dein#tap('deoplete.nvim')
    set completeopt=menuone
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_underbar_completion = 1
    let g:deoplete#sources#syntax#min_keyword_length = 3
    let g:deoplete#min_keyword_length = 3
    let g:deoplete#force_overwrite_completefunc = 1
    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns={}
    endif
    let g:deoplete#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:deoplete#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:deoplete#omni#input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:deoplete#omni#input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:deoplete#omni#input_patterns.javascript = '[^. \t]\.\w*'
endif

if dein#tap('lightline.vim')
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
      \       [ 'fugitive', 'readonly', 'filename', 'anzu', ],
      \     ]
      \   },
      \   'component_function': {
      \     'fugitive': 'MyFugitive',
      \     'filename': 'MyFilename',
      \     'anzu': 'anzu#search_status',
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
endif

if dein#tap('vim-anzu')
    set updatetime=800
    nmap n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)zz
    nmap N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)zz
    augroup vim-anzu
        autocmd!
        autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
    augroup END
endif

if dein#tap('vim-smartchr')
    function! s:enable_smartchr_basic()
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

    function! s:enable_smartchr_extend_comparison()
        inoremap <buffer><expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= ' : search('\(\*\<bar>!\)\%#')? '= ' : smartchr#one_of(' = ', ' == ', ' === ', '=')
    endfunction

    function! s:disable_smartchr()
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
endif

if dein#tap('vim-smartinput')
    call smartinput#define_rule({
    \   'at': '\s\+\%#',
    \   'char': '<CR>',
    \   'input': "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",
    \   })
endif

if dein#tap('vim-smartinput-endwise')
    call smartinput_endwise#define_default_rules()
endif

if dein#tap('vim-ref')
    let g:ref_source_webdict_sites = {
        \ 'alc': {
        \    'url': 'http://eow.alc.co.jp/%s/UTF-8/'
        \   }
        \ }
    function! g:ref_source_webdict_sites.alc.filter(output)
        return join(split(a:output, "\n")[31 :], "\n")
    endfunction
    nnoremap ,alc :<C-u>Ref webdict alc<Space>
endif

if dein#tap('committia.vim')
    let g:committia_hooks = {}
    function! g:committia_hooks.edit_open(info)
        " Additional settings
        call s:setlocal_spelllang()

        " If no commit message, start with insert mode
        if a:info.vcs ==# 'git' && getline(1) ==# ''
            startinsert
        end

        " Scroll the diff window from insert mode
        " Map <C-d> and <C-u>
        imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
        imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
    endfunction
endif

" cursor style
function! s:highlight_cursor()
    hi CursorColumn gui=NONE guifg=NONE guibg=Grey40 cterm=NONE ctermfg=NONE ctermbg=241
    hi CursorLine gui=NONE guifg=NONE guibg=Grey40 cterm=NONE ctermfg=NONE ctermbg=241
    hi Cursor guifg=Black guibg=Lavender cterm=reverse ctermfg=NONE ctermbg=NONE
    hi lCursor guifg=Black guibg=Lavender cterm=reverse ctermfg=NONE ctermbg=NONE
endfunction

augroup vimrc-auto-cursorline
    autocmd!
    autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
    autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
    autocmd WinEnter * call s:auto_cursorline('WinEnter')
    autocmd WinLeave * call s:auto_cursorline('WinLeave')

    let s:cursorline_lock = 0
    function! s:auto_cursorline(event)
        if a:event ==# 'WinEnter'
            setlocal cursorline
            let s:cursorline_lock = 2
        elseif a:event ==# 'WinLeave'
            setlocal nocursorline
        elseif a:event ==# 'CursorMoved'
            if s:cursorline_lock
                if 1 < s:cursorline_lock
                    let s:cursorline_lock = 1
                else
                    setlocal nocursorline
                    let s:cursorline_lock = 0
                endif
            endif
        elseif a:event ==# 'CursorHold'
            setlocal cursorline
            let s:cursorline_lock = 1
        endif
    endfunction
augroup END

augroup MyAutoCmd
    autocmd!
    " highlight cursor
    autocmd ColorScheme * call <SID>highlight_cursor()
    " highlight two-byte spaces
    autocmd ColorScheme * hi link TwoByteSpace Error
    autocmd VimEnter,WinEnter * let w:m_tbs = matchadd("TwoByteSpace", '　')
    " vim-indent-guides color
    autocmd ColorScheme * hi IndentGuidesOdd  ctermbg=237
    autocmd ColorScheme * hi IndentGuidesEven ctermbg=236
    " restore cursor
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    " automated open quickfix-window
    autocmd QuickFixCmdPost *grep* cwindow
    " turn off paste mode when leaving insert
    autocmd InsertLeave * setlocal nopaste
    " switch smartchr
    autocmd FileType c,cpp,cs,glsl,java,javascript,php,python,ruby,coffee,vim call <SID>enable_smartchr_basic()
    autocmd FileType php,javascript call <SID>enable_smartchr_extend_comparison()
    autocmd FileType objc,objcpp,text,markdown,html,xml call <SID>disable_smartchr()
    " from :help smartindent
    autocmd FileType python :inoremap # X#
    " for commit log
    autocmd FileType svn,gitcommit,gitrebase call s:setlocal_spelllang()
    " for javascript completion
    autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
    " auto completion for HTML/XML
    autocmd Filetype html,xml inoremap <buffer> </ </<C-x><C-o>
augroup END

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
