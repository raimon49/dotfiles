set nocompatible

" Setup NeoBundle
filetype off
if has('vim_starting')
  if has('win32') || has('win64')
      let $DOTVIM = expand('~/vimfiles')
  else
      let $DOTVIM = expand('~/.vim')
  endif

  set rtp+=$DOTVIM/neobundle.vim.git

  call neobundle#rc(expand('$DOTVIM/neobundle'))
endif

" Plugins on GitHub
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/html5.vim'
NeoBundle 'vim-jp/vimdoc-ja'

" Plugins on vim-scripts
NeoBundle 'desert256.vim'
NeoBundle 'sudo.vim'
NeoBundle 'svn-diff.vim'
NeoBundle 'surround.vim'
NeoBundle 'php-doc-upgrade'
NeoBundle 'confluencewiki.vim'

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

set expandtab
set autoindent
set smartindent
set showmatch
set tabstop=4
set shiftwidth=4
set smarttab
set listchars=tab:^\ 
set list
set wildmode=list:longest,full

set incsearch
set ignorecase
set smartcase
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set scrolloff=5
set virtualedit=block

set pumheight=10

nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nmap <Tab> <C-W>w
nmap <S-Tab> <C-W>W
nmap tn :tabn<CR>
nmap tp :tabp<CR>
nmap <Space> <C-D>
nmap <S-Space> <C-U>
nmap <CR> o<Esc>
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

imap <C-A> <Home>
imap <C-E> <End>
imap <C-F> <Right>
imap <C-B> <Left>

set statusline=%t%m%r%h%w\ [%{&fileencoding}\ %{&fileformat}]\ [TYPE=%Y]\ [LINE=%04l/%04L(%p%%)]\ [POS=%l,%v]
highlight StatusLine term=bold,reverse cterm=bold,reverse gui=bold,reverse ctermfg=white ctermbg=darkblue
set laststatus=2
 
set t_Co=256
colorscheme desert256

hi CursorColumn gui=NONE guifg=NONE guibg=Grey40 cterm=NONE ctermfg=NONE ctermbg=241
hi CursorLine gui=NONE guifg=NONE guibg=Grey40 cterm=NONE ctermfg=NONE ctermbg=241
hi Cursor guifg=Black guibg=Lavender cterm=reverse ctermfg=NONE ctermbg=NONE
hi lCursor guifg=Black guibg=Lavender cterm=reverse ctermfg=NONE ctermbg=NONE

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

" zencoding-vim
let g:user_zen_settings = {
  \'indentation': '  ',
  \}

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
