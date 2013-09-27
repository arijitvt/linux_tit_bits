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
set tags=./tags;/

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

" This is the customization for the auto completetion"
if v:version >= 600
	filetype plugin on
	filetype indent on
else
	filetype on
endif

if v:version >= 700
	set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
	let OmniCpp_GlobalScopeSearch   = 1
	let OmniCpp_DisplayMode         = 1
	let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
	let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
	let OmniCpp_ShowAccess          = 1 "show access in pop-up
	let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
	set completeopt=menuone,menu,longest
endif

if version >= 700
	let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
	highlight   clear
	highlight   Pmenu         ctermfg=0 ctermbg=2
	highlight   PmenuSel      ctermfg=0 ctermbg=7
	highlight   PmenuSbar     ctermfg=7 ctermbg=0
	highlight   PmenuThumb    ctermfg=0 ctermbg=7
endif

function! UpdateTags()
	execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
	echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction
nnoremap <F5> :call UpdateTags()
"
