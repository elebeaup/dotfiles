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

" Buffers navigation
map <A-Left> :bprev<CR>
imap <silent> <A-Left> <C-O>:bprev<CR>
map <A-Right> :bnext<CR>
imap <silent> <A-Right> <C-O>:bnext<CR>
map <A-h> :bprev<CR>
map <A-l> :bnext<CR>

 " Close the current buffer
map <leader>bd :Bdelete<CR>
nnoremap <F28> :Bdelete<CR>| " <C-F4> showkey -a
map <leader>! :Bdelete!<CR>

" Managing buffers
map <leader>bn :enew<CR>
map <leader>ba :bufdo Bdelete<CR>

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
nmap <S-M-Down> yyp
nmap <S-M-Up> yyP
imap <silent> <C-d> <C-O>:t.<CR>

" Select all
nnoremap <C-A> ggVG

" Terminal
tnoremap <Char-28> <C-\><C-n>| " <C-*> showkey -a

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
vnoremap <silent> <C-f> y/\V<c-r>=escape(@",'/\')<CR><CR>|" To search for visually selected text
vnoremap <C-r> "hy:%s/\V<C-r>=escape(getreg('h"'),'/\')<CR>//gc<left><left><left>|" To search and replace selected text
