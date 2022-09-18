imap jj <Esc>
let mapleader = "\<Space>"
set nowrap
set number
set tabstop=4 shiftwidth=4 expandtab
set autoindent
set smarttab
set incsearch
set hlsearch
set wildmenu
" For NERTtree so that I can add directories and files
set ma

" Install vim plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'pangloss/vim-javascript' 
Plug 'vim-autoformat/vim-autoformat' 
Plug 'preservim/nerdcommenter' 
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sainnhe/everforest'
Plug 'joshdick/onedark.vim'
Plug 'wellle/targets.vim'
Plug 'morhetz/gruvbox' 
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
call plug#end()

" Lint files 
map <leader>f :py3f /home/jared/Installs/clang-format.py<CR>
" Navigate vertical splits
nnoremap <S-l> <C-w>l 
nnoremap <S-h> <C-w>h 
nnoremap <S-k> <C-w>k 
nnoremap <S-j> <C-w>j 
" nerdcommenter space enhancement
let g:NERDSpaceDelims = 1
"" Clears highlighting after search
map <leader>h :set hlsearch!<cr>
" Enables the NERDtree menu with <Space, n>
nnoremap <leader>n :NERDTreeFocus<CR>

""" COLOR SCHEME SECTION
set termguicolors
syntax on
set background=dark
let g:everforest_background = 'medium'
colorscheme everforest

"" Uncomment for Gruvbox Usage
" Necessary for gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox

""" COC
" Use tab to scroll through suggestions
function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Use <c-space> to trigger completion:
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif
" Use <CR> to confirm completion, use:
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
