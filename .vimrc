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
let g:netrw_winsize = 25

" Do not show hidden files
let g:netrw_list_hide= '.*\.swp$'
let g:netrw_list_hide =  '^\.[^\.],'
let g:netrw_list_hide .= '\.pyc$,'
let g:netrw_list_hide .= '\.pyc\s\+,'

" Change directory to the current buffer when opening files.
set autochdir

" No banner
let g:netrw_banner=0

" cursor is underlined
let g:netrw_cursor=3

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Open a file browser if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :call ToggleVExplorer() | endif

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
