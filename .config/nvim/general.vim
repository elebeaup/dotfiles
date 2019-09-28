" By setting the option 'hidden', you can load a buffer in a window that currently has a modified buffer
set hidden

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" -------------------------------------
"  VIM User Interface
" -------------------------------------
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

set background=light
"set background=dark
"colorscheme Tomorrow-Night-Eighties
"colorscheme gruvbox
colorscheme onehalflight
"colorscheme PaperColor

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
set clipboard+=unnamedplus

" Turning off auto indent when pasting text into vim
set pastetoggle=<F3>

" Linebreak on 500 characters
set lbr
set tw=500


" -------------------------------------
"  Plugin setup
" -------------------------------------
" NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"let NERDTreeMapOpenInTab='<ENTER>'

" Vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tmuxline#snapshot_file = '~/.tmuxline.conf'
"let g:airline_theme='tomorrow'
"let g:airline_theme='gruvbox'
let g:airline_theme='onehalflight'
"let g:airline_theme='papercolor'

let g:airline_powerline_fonts = 1
set laststatus=2

" Coc
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <leader><TAB> <Plug>(coc-range-select)
xmap <leader><TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>) | set foldlevel=99

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

" FastFold
"nmap zuz <Plug>(FastFoldUpdate)
"let g:fastfold_savehook = 1
"let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
"let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
"let g:javaScript_fold = 1

"set foldmethod=syntax
"set sessionoptions-=folds

" Expanded when opening a file
au BufRead * normal zR

"let javaScript_fold=1         " JavaScript

" -------------------------------------
"  Shortcuts
" -------------------------------------
nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>

nnoremap <F28> :bd<CR>| " <C-F4> showkey -a
" Increasing or decreasing numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" Cut/Copy/Paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Delete line
nmap <C-y> dd

" Duplicate line
nmap <C-d> yyp

" Select all
nnoremap <C-A> ggVG

" NerdTree
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

" Fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>h :FzfHistory<CR>
nnoremap <Leader>t :FzfBTags<CR>
nnoremap <Leader>T :FzfTags<CR>
nnoremap <C-p> :FzfFiles<CR>
" Have FZF list all tracked files plus untracked files minus your ignored files
nnoremap <Leader>p :FzfGitFiles --exclude-standard --others --cached<CR>
nnoremap <Leader>gt :FzfRg<CR>

" Coc
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" ...
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" ...
