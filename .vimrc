" This must be first, because it changes other options as side effect
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
" call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" It hides buffers instead of closing them. This means that you can 
" have unwritten changes to a file and open a new file using :e, 
" without being forced to write or undo your changes first. Also, 
" undo buffers and marks are preserved while the buffer is open.
set hidden

set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
                  "    shiftwidth, not tabstop
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Comment in the following lines to turn off swap files during crashes
" set nobackup
" set noswapfile

" This enables vim to load plugins, settings or key mappings that 
" are only useful in the context of specific file types
filetype plugin indent on

" Set some file type specific settings
if has('autocmd')
  autocmd filetype python set expandtab
endif

" Syntax highlighting
if &t_Co >= 256 || has("gui_running")
"   colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

" Highlight whitespace in a convenient way
" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Disable tab display for HTML & XML files
autocmd filetype html,xml set listchars-=tab:>.

" Press F2 to switch into paste mode and paste large copy buffer
set pastetoggle=<F2>

" ; works contextually the same as : 
nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Skip to the next row, instead of next newline
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Silence search history
" Clear it with ,/ command
nmap <silent> ,/ :nohlsearch<CR>

" Save as sudo if file not opened with sudo
cmap w!! w !sudo tee % >/dev/null

" Column highlighting
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
