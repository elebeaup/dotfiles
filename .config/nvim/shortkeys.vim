" -------------------------------------
"  Shortcuts
" -------------------------------------
"Map some keys for azerty keyboard
map ² .

" Fast saving 
nmap <leader>w :w!<cr>

" Use CTRL-S for saving, also in Insert mode
nnoremap <C-S>                     :update<CR>
vnoremap <C-S>                <C-C>:update<CR>
inoremap <C-S>                <C-O>:update<CR>

" navigate back and forth among motions
noremap <C-M-Left> <C-O>
noremap <C-M-Right> <C-I>

" Clear highlighting
noremap <esc> <esc>:noh<return>

" Move screen up and down
noremap <C-Up> <C-y>
noremap <C-Down> <C-e>

" Buffers navigation
map <A-Left> :bprev<CR>
imap <silent> <A-Left> <C-O>:bprev<CR>
map <A-Right> :bnext<CR>
imap <silent> <A-Right> <C-O>:bnext<CR>
map <A-h> :bprev<CR>
map <A-l> :bnext<CR>

 " Close the current buffer
map <leader>bd :BD<cr>
nnoremap <F28> :BD<CR>| " <C-F4> showkey -a
map <leader>! :BD!<cr>

" Managing buffers
map <leader>bn :enew<CR>
map <leader>ba :bufdo bd<cr>

 " Managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" Toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader><bs> :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" Paste from yank register
nnoremap "p "0p

" Delete line
imap <C-y> <C-O>dd

noremap Y y$

" Duplicate line
nmap <C-d> yyp
imap <silent> <C-d> <C-O>:t.<CR>

" Select all
nnoremap <C-A> ggVG

" Terminal
tnoremap <Esc><Esc> <C-\><C-n>

" Switch between Windows
" Use <C-w> twice to toggle between open windows
" Use <C-w> followed by h/j/k/l (or arrow keys) to move to the left/bottom/top/right window accordingly.

" Quickly open/reload vim
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :source $MYVIMRC<CR>

" Indent
vnoremap > >gv
vnoremap < <gv

" Move line up/down
nnoremap <C-S-Down> :m+<CR>==
nnoremap <C-S-Up> :m-2<CR>==
inoremap <C-S-Down> <Esc>:m+<CR>==gi
inoremap <C-S-Up> <Esc>:m-2<CR>==gi
vnoremap <C-S-Down> :m'>+<CR>gv=gv
vnoremap <C-S-Up> :m-2<CR>gv=gv

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Fold
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
vnoremap <Leader>za <Esc>`<kzfgg`>jzfG`<| " Everything above and below will be folded.

" Search
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>|" To search for visually selected text

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
nmap <silent> <C-M-B> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <C-S-B> <Plug>(coc-type-definition)
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

" NerdTree
map <F2> :NERDTreeToggle<CR>
nnoremap ,i :NERDTreeFind<CR><c-w><c-w>

" Have FZF list all tracked files plus untracked files minus your ignored files
nnoremap <Leader>p :FzfGitFiles --exclude-standard --others --cached<CR>

" Coc
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" ...
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" ...

" Easy motion
" Type <Leader><Leaderw()<Plug>easymotion-w)( to trigger the word motion w)
map <Leader><Leader> <Plug>(easymotion-prefix)

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
