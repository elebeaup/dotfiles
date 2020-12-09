" -------------------------------------
"  Plugin setup
" -------------------------------------
function! s:hook_post_plugin_loaded()
  for [ plugin_name, plugin_value ] in items(g:plugs)
    let l:func = "s:setup_".substitute(plugin_name, '\v%(vim-)?([a-z]*)%(.nvim|.vim)?', '\1', '')
    if exists("*".l:func) && isdirectory(plugin_value.dir)
      call function(l:func)()
    endif
  endfor
endfunction

" Coc
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

function! s:setup_coc()
  set sessionoptions+=globals

  let g:coc_global_extensions = [
        \ 'coc-json',
        \ 'coc-pairs',
        \ 'coc-tsserver',
        \ 'coc-explorer'
        \ ]

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
  nmap <silent> <C-M-B> <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> <C-S-B> <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)
  nmap <F18> <Plug>(coc-rename)| " S-F6

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

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

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  nnoremap <F36>              :<C-u>CocList outline<cr>| "C-F12
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
  " Show open buffers
  nnoremap <silent> <space>b  :<C-u>CocList buffers<CR>
  " Quick open recent files
  nnoremap <silent> <space>h  :<C-u>CocList mru<CR>
  " Find files
  nnoremap <silent> <space>f  :<C-u>CocList files<CR>
  " Rg search
  nnoremap <silent> <space>g  :<C-u>CocList grep<CR>

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>) | set foldlevel=99

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Coc
  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  " ...
  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  " ...

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  augroup CocAutoCommandsGroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Coc extensions
  map <silent> <F2> :<C-u>CocCommand explorer --toggle<CR>
endfunction

" Fzf
function! s:file_history_from_directory(directory)
  return fzf#vim#_uniq(filter(fzf#vim#_recent_files(), "s:file_is_in_directory(fnamemodify(v:val, ':p'), a:directory)"))
endfunction

function! s:file_is_in_directory(file, directory)
  return filereadable(a:file) && match(a:file, a:directory . '/') == 0
endfunction

function! s:setup_fzf()
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

  " Have FZF list all tracked files plus untracked files minus your ignored files
  nnoremap <Leader>p :FzfGitFiles --exclude-standard --others --cached<CR>
endfunction

" Git Gutter
function! s:setup_gitgutter()
  let g:gitgutter_diff_args = '-w'
endfunction

" Startify
function! s:setup_startify()
  let g:startify_session_dir=$HOME . '/.vim/sessions'

  let g:startify_session_persistence = 1
endfunction

" Unimpaired
function! s:setup_unimpaired()
  nmap ( [
  nmap ) ]
  omap ( [
  omap ) ]
  xmap ( [
  xmap ) ]
endfunction

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

function! s:setup_lightline()
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
endfunction

" ColorScheme
function! s:setup_one()
  colorscheme one
  let g:one_allow_italics = 1
endfunction

" Float term
function! s:setup_floaterm()
  let g:floaterm_keymap_toggle = '<F12>'
  let g:floaterm_keymap_next = '<F24>'| "S-F12
endfunction

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
"Plug 'easymotion/vim-easymotion'
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
call s:hook_post_plugin_loaded()
