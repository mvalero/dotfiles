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
"colorscheme molokai       " set colorscheme
set background=dark
colorscheme solarized

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set hlsearch              " highlight searched phrases.
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
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 4 columns
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 08. CtrlP Key Mappings                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 1

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlPMixed<CR>

" Additional mapping for buffer search
nnoremap <silent> ,b :CloseSingleConque<CR>:CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CloseSingleConque<CR>:CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map ,jm :CloseSingleConque<CR>:CtrlP app/models<CR>
map ,jc :CloseSingleConque<CR>:CtrlP app/controllers<CR>
map ,jv :CloseSingleConque<CR>:CtrlP app/views<CR>
map ,jh :CloseSingleConque<CR>:CtrlP app/helpers<CR>
map ,jl :CloseSingleConque<CR>:CtrlP lib<CR>
map ,jp :CloseSingleConque<CR>:CtrlP public<CR>
map ,js :CloseSingleConque<CR>:CtrlP spec<CR>
map ,jf :CloseSingleConque<CR>:CtrlP fast_spec<CR>
map ,jd :CloseSingleConque<CR>:CtrlP db<CR>
map ,jC :CloseSingleConque<CR>:CtrlP config<CR>
map ,jV :CloseSingleConque<CR>:CtrlP vendor<CR>
map ,jF :CloseSingleConque<CR>:CtrlP factories<CR>
map ,jT :CloseSingleConque<CR>:CtrlP test<CR>

"Cmd-(m)ethod - jump to a method (tag in current file)
map ,m :CloseSingleConque<CR>:CtrlPBufTag<CR>

"Ctrl-(M)ethod - jump to a method (tag in all files)
map ,M :CloseSingleConque<CR>:CtrlPBufTagAll<CR>
