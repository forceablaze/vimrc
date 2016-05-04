" runtime bundle/vim-pathogen/autoload/pathogen.vim
" call pathogen#incubate()
" call pathogen#infect('bundle/{}')
" call pathogen#helptags()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'wincent/command-t'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'fidian/hexmode'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Valloric/YouCompleteMe'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" All of your Plugins must be added before the following line
call vundle#end()            " required

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
"colors monokai
colors zenburn
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

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:pymode_python = 'python3'

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

"let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

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

" Ctrl-] with  new tab 
nmap <C-]> viwy:tab tag <C-R>"<CR>
" map <Leader>n <plug>NERDTreeTabsToggle<CR>

noremap <C-l> :vertical resize +5<CR>
noremap <C-j> :vertical resize -5<CR>
noremap <C-i> :resize +5<CR>
noremap <C-k> :resize -5<CR>

vnoremap <C-c> "+yy
noremap <C-v> "+p

" Hexmode
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>
