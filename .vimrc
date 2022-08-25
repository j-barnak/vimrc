# Requires vim-plug (https://github.com/junegunn/vim-plug)

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
set background=dark

call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'wellle/targets.vim'
Plug 'tmsvg/pear-tree'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" Clears highlighting after search
map <leader>h :set hlsearch!<cr>
" Enables the NERDtree menu with <, n>
nnoremap <leader>n :NERDTreeFocus<CR>
" Necessary for grvbox
autocmd vimenter * ++nested colorscheme gruvbox
