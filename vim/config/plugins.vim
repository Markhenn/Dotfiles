" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " set up Tmux Navigation within vim
    Plug 'christoomey/vim-tmux-navigator'
    " Vim Tmux runner
    Plug 'christoomey/vim-tmux-runner'
    " make Ruby methods an object
    Plug 'nelstrom/vim-textobj-rubyblock'
    Plug 'kana/vim-textobj-user'
    " Tim Popes collection of useful plugin
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-endwise'
    " Advanced Ruby capability
    Plug 'vim-ruby/vim-ruby'
    " Ripgrep support
    " Plug 'jremmen/vim-ripgrep'
    " Lightline Bottom Bar
    Plug 'itchyny/lightline.vim'
    " Molokai theme
    Plug 'fatih/molokai'
    " System copy for vim
    Plug 'christoomey/vim-system-copy'
    " Replace from register
    Plug 'vim-scripts/ReplaceWithRegister'
    " Companion to replace with register keep indendation
    Plug 'vim-scripts/ReplaceWithSameIndentRegister'
    " Displays whitespace and lets it kill it
    Plug 'ntpeters/vim-better-whitespace'
    " Set up wiki files through vim
    Plug 'vimwiki/vimwiki'

    " FZF support
    " Plugin outside ~/.vim/plugged with post-update hook
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
call plug#end()
