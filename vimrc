" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Initialize plugin system
" :PlugInstall to install plugins.
call plug#end()

" Shortcuts
map <C-n> :NERDTreeToggle<CR>

" NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tmuxline#snapshot_file = '~/.tmuxline.conf'
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
set laststatus=2

" -------------------------------------
"  Appearance settings
" -------------------------------------
syntax enable
set background=dark
set t_Co=256

colorscheme Tomorrow-Night-Eighties

" -------------------------------------
"  File & backup settings
" -------------------------------------

set nobackup
set nowb
set noswapfile

" Use spaces, damn it!
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set nowrap
set textwidth=0

" Use the system clipboard
set clipboard+=unnamedplus

" Turning off auto indent when pasting text into vim
set pastetoggle=<F3>

" Line break
set tw=200

" -------------------------------------
"  Shortcuts
" -------------------------------------
map <C-n> :NERDTreeToggle<CR>

" Return to normal mode and back to insert
nmap <Space> i
imap <S-Space> <Esc>
" Return to visual mode
vmap <Space> I

" Move line up/down
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv
