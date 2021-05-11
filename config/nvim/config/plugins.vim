" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " set up Tmux Navigation within vim
    Plug 'christoomey/vim-tmux-navigator'
    " make Ruby methods an object
    Plug 'nelstrom/vim-textobj-rubyblock'
    Plug 'kana/vim-textobj-user'
    " Tim Popes collection of useful plugin
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    " Advanced Ruby capability
    Plug 'vim-ruby/vim-ruby'
    " Ripgrep support
    Plug 'jremmen/vim-ripgrep'
    " Lightline Bottom Bar
    Plug 'itchyny/lightline.vim'
    " Molokai theme
    Plug 'fatih/molokai'
    " System copy for vim
    Plug 'christoomey/vim-system-copy'


    " FZF support
    " Plugin outside ~/.vim/plugged with post-update hook
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
call plug#end()
