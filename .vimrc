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

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to list mode
let g:netrw_liststyle=0

" vertical split
let g:netrw_preview=1

" Vertical split size
let g:netrw_winsize = 100

" Do not show hidden files
let g:netrw_list_hide= '.*\.swp$'
let g:netrw_list_hide =  '^\.[^\.],'
let g:netrw_list_hide .= '\.pyc$,'
let g:netrw_list_hide .= '\.pyc\s\+,'

" Change directory to the current buffer when opening files.
set autochdir

" No banner
let g:netrw_banner=0

" Open a file browser if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :E | endif

" cursor is underlined
let g:netrw_cursor=3


