nnoremap <silent><leader><leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader><leader>sv :source $MYVIMRC<cr>

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap . :normal.<CR>

" Disable arrow keys
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" ino <down> <Nop>
" ino <left> <Nop>
" ino <right> <Nop>
" ino <up> <Nop>

" vno <down> <Nop>
" vno <left> <Nop>
" vno <right> <Nop>
" vno <up> <Nop>

noremap <silent> <C-up> :resize +2<CR>
noremap <silent> <C-down> :resize -2<CR>
noremap <silent> <C-Left> :vertical resize +2<CR>
noremap <silent> <C-Right> :vertical resize -2<CR>
noremap <silent> <C-up> :vertical resize +2<CR>
noremap <silent> <C-down> :vertical resize -2<CR>


nnoremap Y y$
" nnoremap n nzzzv
" nnoremap N Nzzzv
nnoremap J mzJ`z


" Change text without putting it into the vim register,
" see https://stackoverflow.com/q/54255/6064933
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c

inoremap <C-v> <ESC>"+p<ESC>
" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d


" Jumplist mutation
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
"Moving Text
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==


com! W w


" Prevent selecting and pasting from overwriting what you originally copied.
" xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Insert mode navigate up and down
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

nnoremap <silent> <esc> :noh<return><esc>

" Search and Replace
" nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" nnoremap <Leader>s :sp<CR>
" nnoremap <Leader>w :vs<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>o :on<CR>

nnoremap <leader>F mzgg=G`z
nnoremap J mzJ`z
" Make Q repeat last macro
nnoremap Q @@
" General {{{


" CTRL-U in insert mode deletes a lot.	Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Go to start or end of line easier
" nnoremap H ^
" xnoremap H ^
" nnoremap L g_
" xnoremap L g_


map ' `

nnoremap <leader>R :set wrap!<CR>

" noremap <A-j> gT
" noremap <S-h> ^
" noremap <A-k> gt
" noremap <S-l> $

nnoremap j gj
nnoremap k gk

" hightlight last pasted content
nnoremap gp `[v`]

nnoremap <leader>rm :RemoveMarks<CR>

nnoremap <leader><leader>c :Themery<cr>

" register mapping
"
nnoremap <leader>1 "a
vnoremap <leader>1 "a

nnoremap <leader>2 "b
vnoremap <leader>2 "b

nnoremap <leader>3 "c
vnoremap <leader>3 "c

nnoremap <leader>4 "d
vnoremap <leader>4 "d

nnoremap <leader>5 "e
vnoremap <leader>5 "e

" map :w :up
