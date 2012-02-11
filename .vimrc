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
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/html5.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-gf-diff'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'taku-o/vim-vis'

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
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set scrolloff=5
set virtualedit=block

set pumheight=10

map gf <C-W>gf

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
nmap <silent> <Space>.  :<C-u>edit $MYVIMRC<CR>
nmap <silent> <Space>s. :<C-u>source $MYVIMRC<CR>

inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>

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

" vim-powerline
set laststatus=2
if has('unix') && !has('gui_running')
    inoremap <silent> <Esc> <Esc>
    inoremap <silent> <C-[> <Esc>
endif

" vim-smartchr
inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')
inoremap <expr> , smartchr#one_of(', ', ',')
inoremap <expr> : smartchr#one_of(': ', ':')

" syntastic
let g:syntastic_auto_jump=1
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

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
    if &term == "xterm-256color"
        let &t_SI .= "\eP\e[?2004h\e\\"
        let &t_EI .= "\eP\e[?2004l\e\\"
        let &pastetoggle = "\eP\e[201~\e\\"
    else
        let &t_SI .= "\e[?2004h"
        let &t_EI .= "\e[?2004l"
        let &pastetoggle = "\e[201~"
    endif

    function! XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
