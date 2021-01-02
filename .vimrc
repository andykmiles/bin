set nocompatible              " required
filetype off                  " required
:set number
:set paste
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufNewFile,BufRead *.py
                        \ set tabstop=4 |
                        \ set softtabstop=4 |
                        \ set shiftwidth=4 |
                        \ set textwidth=79 |
                        \ set expandtab |
                        \ set autoindent |
                        \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
                        \ set tabstop=2 |
                        \ set softtabstop=2 |
                        \ set shiftwidth=2

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'nanotech/jellybeans.vim' 
Plugin 'mcchrish/nnn.vim'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'skywind3000/asyncrun.vim'
Plugin 'skywind3000/asynctasks.vim'
Plugin 'skanehira/docker.vim'
Plugin 'integralist/vim-mypy'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/tabman.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

colorscheme jellybeans
filetype plugin indent on    " required

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let python_highlight_all=1

set expandtab
set tabstop=4
set softtabstop=4
autocmd VimEnter * wincmd p
set whichwrap+=<,>,h,l,[,]

let python_highlight_all=1
syntax on


inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

let g:jellybeans_overrides = {
                        \    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
                        \              'ctermfg': 'Black', 'ctermbg': 'Yellow',
                        \              'attr': 'bold' },
                        \    'Comment': { 'guifg': 'cccccc' },
                        \}

if &term =~ '256color'
        " disable Background Color Erase (BCE)
        set t_ut=
endif

set background=dark
set colorcolumn=72,79
set wrap linebreak nolist

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0

let g:indentLine_char = '|'
autocmd BufRead,BufNewFile * setlocal signcolumn=yes
let g:syntastic_python_checkers = ['mypy', 'flake8']
let g:asyncrun_open = 6
