" By setting the option 'hidden', you can load a buffer in a window that currently has a modified buffer
set hidden

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let g:mapleader = "ù"

augroup AutoCommandsGroup
  " Reloads vimrc after saving but keep cursor position
  autocmd! BufWritePost $MYVIMRC,~/.config/nvim/general.vim,~/.config/nvim/plugin_list.vim,~/.config/nvim/shortkeys.vim source % | echom "Reloaded " . $MYVIMRC | redraw

  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Expanded when opening a file
  au BufRead * normal zR

  " Prevent the coc-explorer window from being replaced by another window
  autocmd BufEnter * if bufname('#') =~# '^\[coc-explorer]\-.$' | b# | endif
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

"set background=light
"set background=dark
colorscheme onehalfdark

hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightM
hi PMenu ctermbg=white guibg=white
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

" -------------------------------------
"  Plugin setup
" -------------------------------------
" Coc
set sessionoptions+=globals

let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-pairs',
	\ 'coc-tsserver',
  \ 'coc-explorer'
\ ]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>) | set foldlevel=99

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Fzf
let g:fzf_command_prefix = 'Fzf'

command! -bang -nargs=? -complete=dir FzfFiles
    \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'bat --style=numbers --color=always {}']}, <bang>0)

command! -bang -nargs=* FzfTags
    \ call fzf#vim#tags(<q-args>, {'options': '-n1'}, <bang>0)

" Scoped History Finders
command! FzfPHistory call fzf#run({
      \ 'source':  s:file_history_from_directory(getcwd()),
      \ 'sink':    'edit',
      \ 'options': '-m -x +s',
      \ 'down':    '40%' })

function! s:file_history_from_directory(directory)
  return fzf#vim#_uniq(filter(fzf#vim#_recent_files(), "s:file_is_in_directory(fnamemodify(v:val, ':p'), a:directory)"))
endfunction

function! s:file_is_in_directory(file, directory)
  return filereadable(a:file) && match(a:file, a:directory . '/') == 0
endfunction

" Git Cutter
let g:gitgutter_diff_args = '-w'

" Startify
let g:startify_session_dir=$HOME . '/.vim/sessions'

let g:startify_session_persistence = 1

" Unimpaired
nmap ( [
nmap ) ]
omap ( [
omap ) ]
xmap ( [
xmap ) ]
