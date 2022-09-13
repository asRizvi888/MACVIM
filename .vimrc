set nocompatible
set nu
set rnu
set autoread
set mouse+=a
set autochdir
set guicursor=
set showtabline=5
set guifont="FiraCode NF"\ 13
set complete+=kspell
set completeopt+=menuone,longest,preview,menu
set wildmenu
set background=dark
set fdm=indent
set nofoldenable
set smartindent
set ai
set incsearch
set laststatus=2
set shiftwidth=4
set ma
set tabstop=4
set nowrap
set noswapfile
set scrolloff=5
set noerrorbells
set encoding=UTF-8

colorscheme slate
autocmd VimEnter * hi Normal ctermbg=none

syntax on
filetype plugin on
filetype indent on
" Documentation on hover

"mappings
let mapleader = ","

nnoremap vv <c-v>
nmap <C-v> <esc>gP
nmap <C-a> <esc>ggVG<CR>
nmap <C-c> <esc>:y+<CR>

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" tab management
nmap <C-t> :tabnew!<CR>
nmap <C-n> :tabnext<CR>
nmap <C-p> :tabprevious<CR>
nmap <C-k> :tabclose!<CR>
nmap <C-b> :bu  
nmap <C-z> :qa!<CR>

"Toggle Lexplore with Ctrl-O

let g:netrw_banner = 0
let g:netrw_liststyle = 3

au FileType netrw set scl=no

function! ToggleVExplorer()
	Lexplore
    vertical resize 30
endfunction

nmap <C-O> :call ToggleVExplorer()<CR>

"Toggle Terminal

function! ToggleVTrem()
	vertical botright term
    vertical resize 45
endfunction 

nmap <C-L> 		:call ToggleVTrem()<CR>

function! ToggleBterm()
	bel term
  	resize 10
endfunction 
nmap <C-H> 		:call ToggleBterm()<CR>

nmap <C-left> 	:vertical resize -2 <CR>
nmap <C-right> 	:vertical resize +2 <CR>
nmap <C-up> 	:resize -2 <CR>
nmap <C-down> 	:resize +2 <CR>

"compiler(s)
autocmd filetype cpp 		nmap <buffer> <f9> :w<bar>!g++ % -o %:r  && ./%:r<CR>
autocmd filetype c 			nmap <buffer> <f9> :w<bar>!gcc % -o %:r  && ./%:r<CR>
autocmd filetype java 		nmap <buffer> <f9> :w<bar>!java %<CR>
autocmd filetype java 		nmap <buffer> <f5> :w<bar>!javac % && java %:r<CR>
autocmd filetype javascript nmap <buffer> <f9> :w<bar>!node %<CR>
autocmd filetype typescript nmap <buffer> <f9> :w<bar>!ts-node %<CR>
autocmd filetype python 	nmap <buffer> <f9> :w<bar>!python3 %<CR>
autocmd filetype cpp 		nmap <buffer> <f4> :w<bar>!g++ % -o %:r  && ./%:r < "in_"%:r <CR>
autocmd filetype cpp 		nmap <buffer> <f5> :w<bar>!g++ % -o %:r  && ./%:r <

autocmd filetype vim		nmap <f9> :w!<bar>so %<CR>

"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
