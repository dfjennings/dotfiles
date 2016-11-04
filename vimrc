set number              " Show line numbers
set linebreak           " Break lines at word (requires Wrap lines)
set showbreak=+++       " Wrap-broken line prefix
set textwidth=100       " Line wrap (number of cols)
set showmatch           " Highlight matching brace
set visualbell          " Use visual bell (no beeping)

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
set laststatus=2
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
set showcmd

" enable filetype plugins and indention
filetype plugin indent on

"===================================
"===================================
" key bindings
"===================================
"===================================

let mapleader = ','


"===================================
" courtesy of Rob Agle to work with
" his tmux configuration
"===================================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"===================================
"===================================
" vim plug
" github.com/junegunn/vim-plug
"===================================
"===================================

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'myusuf3/numbers.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'davidhalter/jedi-vim'
Plug 'mitsuhiko/vim-python-combined'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'othree/html5.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'lambdatoast/elm.vim'

" if using in putty, be sure to install solarized for it as well
" per https://github.com/brantb/solarized/tree/master/putty-colors-solarized
Plug 'altercation/vim-colors-solarized'  " http://ethanschoonover.com/solarized/vim-colors-solarized

call plug#end()

let g:numbers_exclude = ['nerdtree']

map <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NumbersToggle<CR>    " toggles between relative and absolute numbering
nnoremap <F4> :NumbersOnOff<CR>     " shows/hides numbers
map <F5> :SyntasticToggleMode<CR>
nmap <F8> :TagbarToggle<CR>


" Ack on <leader>a
nnoremap <leader>a :Ack 
nnoremap <leader>A :AckFromSearch<CR>

syntax enable
set background=dark
let g:solarized_visibility =  "low"
set t_Co=256
let g:solarized_termcolors = 256
colorscheme solarized

"--------------------------
"NERDTree Config
"--------------------------

"autocmd vimenter * if !argc() | NERDTree | endif  "Open NT if no file specified

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif   " close VIM if NT is only buffer open

""Settings I like taken from SPF13
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

"--------------------------
" template language support (SGML / XML too)
"--------------------------
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

"-------------------------- 
" python support from Armin Ronacher https://github.com/mitsuhiko/dotfiles/blob/master/vim/vimrc
"--------------------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions=croq softtabstop=4 textwidth=74 comments=:#\:,:#
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1

let g:syntastic_python_checkers=['flake8', 'python']
let g:syntastic_python_flake8_args='--max-line-length=120'

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

"--------------------------
" recommended settings for beginners https://github.com/scrooloose/syntastic#3-recommended-settings
"--------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"--------------------------
" JEDI vim settings
"--------------------------

let g:jedi#use_tabs_not_buffers = 1

