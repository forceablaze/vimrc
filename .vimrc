call pathogen#incubate()
call pathogen#helptags()

syntax on
set nu
set bs=2			" allow backspacing over everything in insert mode
set ruler			" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set history=50		" keep 50 lines of command line history

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific plugins
filetype indent on

"colors vgod
colors monokai
"let g:molokai_original = 1

set hlsearch
set showmatch
set showmode
set autoindent
set incsearch
set smarttab
set smartcase
set ignorecase

"folding settings
set foldmethod=syntax "fold based on indent
set foldnestmax=10 "deepest fold is 10 levels
set nofoldenable "disable folding by default
"set foldlevel=1

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gb2312,ucs-bom

" status line
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "")
	return curdir
endfunction

function! HasPaste()
	if &paste
		return '[PASTE]'
	else
		return ''
	endif
endfunction


set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|

let mapleader=","
let g:mapleader=","
" move to and maximize the below split 
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split 
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split 
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split  
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others 
set wmh=0                     " set the min height of a window to 0 so we can maximize others

map <S-H> gT
map <S-L> gt
map <C-t><C-t> :tabnew<CR>
map <C-t><C-w> :tabclose<CR> 

nmap <leader>/ :nohl<CR>

nmap <leader>p :set paste!<BAR>set paste?<CR>

autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
nnoremap <silent> <F5> :NERDTreeTabsToggle<CR>
"nnoremap <silent> <F6> :TlistToggle<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>

autocmd FileType make setlocal noexpandtab

" map <Leader>n <plug>NERDTreeTabsToggle<CR>
