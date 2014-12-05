syn on
set ts=4
set sw=4
set et
set nowrap
set background=dark
set ignorecase
set nocompatible
" highlight whitespace at end of line
match ErrorMsg /\s\+$/

" Make resizing splits with the mouse work in tmux
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Status bar
set laststatus=2        "always show
set statusline=%F       "full path to the file
set statusline+=[%{&ff}] "file format
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" nerdtree loading here
execute pathogen#infect()

" Open a file browser if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | tabnew | NERDTree | tabfirst | endif
