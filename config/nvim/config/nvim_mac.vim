" neo vim set up

" sets the colors to term gui to enable true colors need to find out if it is really needed
" set termguicolors
set grepprg=rg\ --vimgrep

" Set up lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" lightline this turns off the default display
set noshowmode


