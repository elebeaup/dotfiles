" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" File type icons
Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
"Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'

" Theme
"Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
"Plug 'NLKNguyen/papercolor-theme'

" Syntax Highlighting And Indentation For 100+ Languages
Plug 'sheerun/vim-polyglot'

" Autocompletion & Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc-tsserver', {'do': 'npm install'}
"Plug 'neoclide/coc-json', {'do': 'npm install'}

" Utilities
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'Konfekt/FastFold'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" :PlugInstall to install plugins.
call plug#end()
