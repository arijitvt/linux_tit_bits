filetype on
filetype plugin indent on
syntax on
set path=.,..,/usr/local/include,/usr/include,,
set bs=indent,eol,start
set smarttab
set autoindent
set smartindent
set cindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set wildmode=list:longest
set noswapfile
set mouse=a

if !has('gui_running')
	"colo dejavu 
	"colo desert256
	"colo desert
	set virtualedit=block,insert
	set nocursorcolumn
	set nocursorline
endif

map <space> :tabn<CR>
map <c-h> :tabp<CR>

"set grepprg=ack\ -w\ --no-group

" Use ack for list of files and use vimgrep with it
"map gw :grep <cword><cr><esc>:cw<cr>
"map gw :vimgrep <cword> **/*.[ch] <cr><esc>:cw<cr>
map gw :vimgrep <cword> `ack -f` <cr><esc>:cw<cr>

set shiftwidth=8
set tabstop=8
set noexpandtab
map <F2> :shell<CR>
map <C-s> :w<CR>
nmap <silent> <F3> :tabprev<CR>
nmap <silent> <F4> :tabnext<CR>
nmap <silent> <C-S-t> :tabnew<CR>
imap <silent> <C-n> <esc><C-n>
imap <silent> <C-p> <esc><C-p>
