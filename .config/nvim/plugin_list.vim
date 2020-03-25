" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" File type icons
Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
"Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Syntax Highlighting And Indentation For 100+ Languages
Plug 'sheerun/vim-polyglot'

" Autocompletion & Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Utilities
"Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'tpope/vim-fugitive'
"Plug 'Konfekt/FastFold'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" :PlugInstall to install plugins.
call plug#end()
