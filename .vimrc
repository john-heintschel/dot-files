set nocompatible

set shell=/bin/bash
set showcmd

call plug#begin('~/.local/share/nvim/plugged')
Plug 'cakebaker/scss-syntax.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'isRuslan/vim-es6'

Plug 'kchmck/vim-coffee-script'
Plug 'leshill/vim-json'
Plug 'markcornick/vim-terraform'
Plug 'mileszs/ack.vim'
Plug 'mustache/vim-mustache-handlebars'

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'

Plug 'python/black'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wesQ3/vim-windowswap'
Plug 'leafgarland/typescript-vim'

Plug 'jparise/vim-graphql'

call plug#end()

:let mapleader = " "
syntax on
filetype plugin indent on
set number relativenumber

let g:ackprg = 'ag --nogroup --nocolor --column'

function! PasteStatusLineFlag()
    if &paste
        return '[paste]'
    endif

    return ''
endfunction

set laststatus=2
set statusline=%<%f\ %m%r
" set statusline+=%{fugitive#statusline()}
" set statusline+=%#warningmsg#
set statusline+=%{PasteStatusLineFlag()}
set statusline+=%=
set statusline+=\ <<
set statusline+=\ %{strftime('%I:%M:%p',getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %p%%
set statusline+=\ >>

let g:ctrlp_clear_cache_on_exit = 0

let g:jedi#use_splits_not_buffers = "right"

" stop entering ex mode!
noremap Q <Nop>

nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>

nnoremap <leader>t :NERDTreeToggle<CR>

nnoremap <leader>a :Ack!<Space>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>m 20<C-W>>
nnoremap <leader>l 20<C-W><

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

set wildignore+=*.pyc,*.class,*.o,gen/*
set wildignore+=*/node_modules/*,_media,build/*

" move backups outside of working directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set title
set clipboard=unnamed
set mouse=a

set splitbelow
set splitright
set hlsearch
set incsearch
set ignorecase
set smartcase " case-sensitive searches if there are caps in the search string

imap <Tab> <C-P>
autocmd BufWritePre * %s/\s\+$//e


" experimental
set diffopt+=vertical
hi DiffAdd guifg=NONE ctermfg=NONE guibg=#464632 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE
hi DiffText guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
augroup filetype javascript syntax=javascript
