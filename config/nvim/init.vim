" Loads the configuration files from vim into neo vim

" let &packpath = &runtimepath
" source ~/.vim/vimrc

" -----------------------------------------------------

" load plugins
source $HOME/.config/nvim/config/plugins.vim

" load linux or mac config
if system('uname')=~'Darwin'
  source $HOME/.config/nvim/config/nvim_mac.vim
else
  source $HOME/.config/nvim/config/nvim_linux.vim
endif

" -----------------------------------------------------
" colorscheme for sublime
colorscheme molokai
set number
set relativenumber
set textwidth=80
set colorcolumn=+1
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" show special characters
set list
"Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" sets a softwrap for lines longer than the editor
set wrap linebreak

highlight Whitespace ctermfg=White
" tell which is a match
match Whitespace /\s/
set nowrap

" Updating colors for lines numbers and trailing white space
set cursorline
" highlight Normal ctermbg=None "Sets background to terminal setting
highlight LineNr ctermfg=DarkGrey
highlight Special ctermfg=Red
" Sets the visual mode to orange like cursorline
highlight Visual ctermfg=208 cterm=reverse

" -----------------------------------------------------
" VimWiki Config
" This makes vimWiki work better with gollum
" let g:vimwiki_list = [{'path': '~/Dropbox (Personal)/Notes/DocuWare-GEVERKA-Documentation/', 'syntax': 'markdown', 'ext': '.wiki'}]
" let g:vimwiki_ext2syntax = {'.wiki': 'markdown'}

" -----------------------------------------------------
" Autocommands
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80
  " Bind `q` to close the buffer for help files
  autocmd Filetype help nnoremap <buffer> q :q<CR>
  " add md suffix for gf file search
  autocmd BufRead,BufNewFile *.md set suffixesadd+=.md
  " creates an autocommand to set comments to continue on o
  autocmd FileType * set formatoptions-=o formatoptions+=r
augroup END

" -----------------------------------------------------
" Mappings

" Remap escape to enter normal mode in terminal mode
" This doesnt work with fzf
if has('nvim')
   tnoremap <Esc> <C-\><C-n>
   tnoremap <C-v><Esc> <Esc>
endif
" The autocommand makes sure the <esc> works to remove the fzf window
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" 0 the same as ^
nmap 0 ^

" http://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
" better jk normally but don't remap when it's called with a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Remap jk combination to <esc>
imap jk <esc>:w<cr>
imap kj <esc>:w<cr>

" Remap <C-p> to call FZF search
nnoremap <C-p> :<C-u>FZF<CR>

" Use the space key as our leader. Put this near the top of your vimrc
let mapleader = "\<Space>"

nmap<leader>vn :vnew<cr>
nmap<leader>w :w<cr>
nmap<leader>q :q<cr>
nmap<leader>sa :saveas
nmap<leader>dap ggdG:r!pbpaste<cr>ggdd
nmap<leader>dps <leader>dap<leader>sa
nmap<leader>vim :vsp ~/.vim/vimrc<cr>
nmap<leader>nvim :vsp ~/.config/nvim/init.vim<cr>
nmap<leader>zsh :vsp ~/.zshrc<cr>
nmap<leader>tmux :vsp ~/.tmux.conf<cr>
nmap<leader>bi :PlugInstall<cr>
" nmap<leader>svim :source $MYVIMRC<cr>
nmap<leader>svim :source %<cr>
nmap<leader>szsh :!source ~/.zshrc<cr>
" Paste require pry, binding.pry into file
nnoremap<leader>pry orequire 'pry'; binding.pry<ESC>

" Remap to make replacing work more easily
nmap <leader>gr "*gr
nmap <leader>gR "*gR
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
" Kill all extra white space
nnoremap <leader>wht :StripWhitespace<cr>:w<cr>
