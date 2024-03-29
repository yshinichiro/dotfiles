"if !(has('win32') || has('mac')) && has('multi_lang')
"if !exists('$LANG') || $LANG.'X' ==# 'X'
"if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
"language ctype ja_JP.eucJP
"endif
"if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
"language messages ja_JP.eucJP
"endif
"endif
"endif


"文字コードの自動認識
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
elseif iconv("\x87\x64\x87\x6a", 'cp932','euc-jisx0213') ==# "\xad\xc5\xad\xcb"
	let s:enc_euc = 'euc-jisx0213'
	let s:enc_jis = 'iso-2022-jp-3'
endif
" fileencodingsを構築
if &encoding ==# 'utf-8'
	let s:fileencodings_default = &fileencodings
	let &fileencodings = s:enc_jis.','. s:enc_euc .',cp932'
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

"定数を処分
unlet s:enc_euc
unlet s:enc_jis
endif
"
"日本語を含まない場合はfileencodingにencodingを使うようにする
if has('autocmd')
	function! AU_ReCheck_FENC()
	if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]",'n') == 0
	let &fileencoding=&encoding
	endif
	endfunction
	autocmd BufReadPost * call AU_ReCheck_FENC()
endif

"	改行コードの自動認識
set fileformats=unix,dos,mac
"	□とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
	set ambiwidth=double
endif

set term=builtin_linux
set term=builtin_xterm

syntax off

colorscheme torte
"autocmd VimEnter * :GuiColorScheme wombat

map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>
map <F4> <ESC>:bw<CR>

set noswapfile
set nobackup
set autoindent
set smartindent
set showmatch
set wildmenu
set tabstop=4

set softtabstop=4
set shiftwidth=4

set backspace=2
set wrapscan
set ignorecase

set nonumber
set nolist
set laststatus=2
set showcmd
set title
set hlsearch


let php_sql_query =1
let php_htmlInString =1
let php_folding=1

set nocompatible
set noshowcmd
set cmdheight=2

set tags+=tags;

