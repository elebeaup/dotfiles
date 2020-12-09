" By setting the option 'hidden', you can load a buffer in a window that currently has a modified buffer
set hidden

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let g:mapleader = "ù"

augroup AutoCommandsGroup
  autocmd!

  " Reloads vimrc after saving but keep cursor position
  autocmd BufWritePost $MYVIMRC,~/.config/nvim/general.vim,~/.config/nvim/plugin_list.vim,~/.config/nvim/shortkeys.vim source % | echom "Reloaded " . $MYVIMRC | redraw

  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Expanded when opening a file
  au BufRead * normal zR
augroup END

" -------------------------------------
"  VIM User Interface
" -------------------------------------
if has("persistent_undo")
  set undofile
endif

" By setting the option 'hidden', you can load a buffer in a window that currently has a modified buffer
set hidden

" Set to auto read when a file is changed from the outside
set autoread

" Do not show mode (displayed by airine)
set noshowmode

" Higlight the line containing the cursor
set cursorline

set path+=**
set wildignore+=**/node_modules/*,**/.git/*,**/target/*

" Turn on the Wild menu
set wildmenu
" Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" Enable mouse
set mouse=a

" Enable line numbers
set number

"autocmd BufWrite * mkview
"autocmd BufRead * silent! loadview

" -------------------------------------
" Colors and Fonts
" -------------------------------------
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette
set t_Co=256

" Set utf8 as standard encoding
set encoding=utf8

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

"hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
"hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightM
" -------------------------------------
"  File & backup settings
" -------------------------------------

" Turn backup off
set nobackup
set nowb
set noswapfile

" -------------------------------------
" => Text, tab and indent related
" -------------------------------------

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

" Use the system clipboard
set clipboard=unnamedplus

" Turning off auto indent when pasting text into vim
set pastetoggle=<F3>

" Linebreak on/ 500 characters
set lbr
set tw=500

" Command line completion
set wildmode=longest,full
cnoremap <expr> <up> wildmenumode() ? "\<C-p>" : "\<Up>"
cnoremap <expr> <down> wildmenumode() ? "\<C-n>" : "\<Down>"
cnoremap <expr> <left> wildmenumode() ? "\<SPACE><BS><Left>" : "\<Left>"
cnoremap <expr> <right> wildmenumode() ? "\<SPACE><BS><Right>" : "\<Right>"
