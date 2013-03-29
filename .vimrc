
call pathogen#runtime_append_all_bundles()
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

filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific plugins
