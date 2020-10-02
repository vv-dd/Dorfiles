" Install: pathogen, gruvbox, vim-polyglot, vim-airline, vim-prettier, nerdtree

" Load the Pathogen plugin
execute pathogen#infect()

" Basic VIM settings
set encoding=UTF-8
syntax on
filetype plugin indent on
set number
set numberwidth=4
set splitbelow
set splitright

" Switch default VIM to Python 3
let g:pymode_python='python3'

" Color scheme
let g:gruvbox_italix=1
colorscheme gruvbox
set t_Co=256
" Remove the pesky #262626 background color
hi Normal guibg=NONE ctermbg=NONE

" Key bindings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-u> <C-w>-
nnoremap <C-i> <C-w>+
nnoremap <C-y> <C-w><
nnoremap <C-o> <C-w>>
nnoremap <space> za
:map <F2> :NERDTreeToggle<CR>
:map <C-p> :Prettier<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
augroup javascript_folding
	au!
	au FileType javascript setlocal foldmethod=syntax
augroup END

" Indentation settings
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.scss
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2

" Highlight white spaces
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Enable Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.html,*.css,*.scss,*.json,*.md PrettierAsync
