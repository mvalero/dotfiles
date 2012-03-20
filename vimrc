""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Filename: .vimrc                                                         "
" Maintainer: Michael J. Smalley <michaeljsmalley@gmail.com>                 "
"        URL: http://github.com/michaeljsmalley/dotfiles                     "
"                                                                            "
"                                                                            "
" Sections:                                                                  "
"   01. General ................. General Vim behavior                       "
"   02. Events .................. General autocmd events                     "
"   03. Theme/Colors ............ Colors, fonts, etc.                        "
"   04. Vim UI .................. User interface behavior                    "
"   05. Text Formatting/Layout .. Text, tab, indentation related             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
set backup                " keep a backup file
set backupdir=~/.vim/backups
set history=100           " keep 50 lines of command line history

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2

"autocmd Filetype htmldjango source ~/.vim/bundle/vim-sparkup/ftplugin/html/sparkup.vim

" augroup sparkup_types
"   autocmd! " Remove ALL autocommands for the current group.
"   autocmd FileType mustache,php,htmldjango runtime!  ftplugin/html/sparkup.vim
" augroup END
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme molokai       " set colorscheme

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
"set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set cursorline            " Highlight current line
set go-=T                 " Hide MacVim toolbar by default
set gfn=Monaco:h10        " Set font to monaco
set showmatch
"set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\   " Filename
    set statusline+=%w%h%m%r " Options
    "set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set smartindent           " smart-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Completion                                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :set wildmenu enables a menu at the bottom of the vim/gvim window.
set wildmenu
" list:longest - When > 1 match, list all matches and
" complete till longest common string.
" full - enables you to tab through the remaining completions
set wildmode=list:longest,full
"set completeopt=menuone,preview      " My old mode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 07. Key Mappings                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pane movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

let mapleader = ','       " set mapleader in , key

nnoremap <leader><space> :noh<cr>
