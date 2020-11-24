" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" File type icons
Plug 'ryanoasis/vim-devicons'

" Theme
Plug 'itchyny/lightline.vim'
Plug 'rakr/vim-one'

" Syntax Highlighting And Indentation For 100+ Languages
Plug 'sheerun/vim-polyglot'

" Autocompletion & Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" Utilities
"Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'tpope/vim-fugitive'
"Plug 'Konfekt/FastFold'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
" Place, toggle and display marks
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
" Enable repeating supported plugin maps with .
Plug 'tpope/vim-repeat'
" Add complementary pairs of mappings
Plug 'tpope/vim-unimpaired'
" Delete buffers without closing your windows
Plug 'moll/vim-bbye'
" Smooth scrolling
Plug 'psliwka/vim-smoothie'
" Floating window
Plug 'voldikss/vim-floaterm'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" :PlugInstall to install plugins.
call plug#end()
