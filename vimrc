" </3 vi
set nocompatible

execute pathogen#infect()

" Enable filetype plugins
filetype plugin on
filetype indent on

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

" Turning off auto indent when pasting text into vim
set pastetoggle=<F3>

" Line break
set tw=200

let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
  augroup END
end
