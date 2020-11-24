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

colorscheme one
let g:one_allow_italics = 1

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
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

" Light line
function! LightLinePercent()
  return &ft ==# 'coc-explorer' || &ft ==# 'startify' ? '' : line('.') * 100 / line('$') . '%'
endfunction

function! LightLineLineInfo()
  return &ft ==# 'coc-explorer' || &ft ==# 'startify' ? '' : line('.').':'. col('.')
endfunction

function! LightLineFilename()
  return &ft ==# 'coc-explorer' || &ft ==# 'startify' ? '' :
        \ expand('%:t') !=# '' ? expand('%:~:.') : '[No Name]'
endfunction

function! LightLineReadonly()
  return &readonly && &ft !=# 'help' && &ft !=# 'coc-explorer' ? 'RO' : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'component_function': {
      \   'filetype': 'LightLineFiletype',
      \   'fileformat': 'LightLineFileformat',
      \   'percent': 'LightLinePercent',
      \   'lineinfo': 'LightLineLineInfo',
      \   'filename': 'LightLineFilename',
      \   'readonly': 'LightLineReadonly'
      \ }
      \ }

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
