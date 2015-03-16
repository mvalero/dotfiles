set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins

" Basic
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'danro/rename.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/L9'
Plugin 'tpope/vim-ragtag'
Plugin 'vim-scripts/simplefold'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'reinh/vim-makegreen'
Plugin 'airblade/vim-rooter'
Plugin 'bling/vim-airline'
Plugin 'skwp/greplace.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Language Specific
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'nono/vim-handlebars'
Plugin 'tpope/vim-markdown'
Plugin 'othree/html5.vim'
Plugin 'briancollins/vim-jst'
Plugin 'pangloss/vim-javascript'
Plugin 'scottmcginness/vim-jquery'
Plugin 'skwp/vim-rspec'

" Themes
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'dterei/VimCobaltColourScheme'
Plugin 'stulzer/heroku-colorscheme'
Plugin 'jgdavey/vim-railscasts'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ricardovaleriano/vim-github-theme'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'gertjanreynaert/cobalt2-vim-theme'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'abra/vim-abra'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Tabs/spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Basic options
set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set completeopt=longest,menu
set visualbell
set cursorline
set ruler
set backspace=indent,eol,start
set laststatus=2
set number

" Backup stuff
set nobackup
set nowritebackup
set noswapfile

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

if has("autocmd")
  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")


map Q gq

" Leader
let mapleader = ","

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
map <leader><space> :noh<cr>

" Soft/hard wrapping
set nowrap

" Use the same symbols as TextMate for tabstops and EOLs
" set list
" set listchars=tab:▸\ ,eol:¬

" Color scheme (terminal)
syntax on

let g:fuf_splitPathMatching=1

" Use the damn hjkl keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" And make them fucking work, too.
nnoremap j gj
nnoremap k gk

" Easy split screen buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>v <C-w>v<C-w>l
map <leader>h <C-w>s

" NERDTree trigger
nnoremap <leader>n :NERDTreeToggle<CR>

" Clean whitespace
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Ack
map <leader>a :Ack

if executable('ag')
  " let g:ackprg = 'ack --nogroup --nocolor --column'
  let g:ackprg = 'ag --vimgrep'
endif

" Yankring
nnoremap <silent> <F3> :YRShow<cr>
nnoremap <silent> <leader>y :YRShow<cr>

" Faster Esc
inoremap jj <ESC>

" Edit .vimrc
nmap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Move lines up and down
map <C-DOWN> :m +1 <CR>
map <C-UP> :m -2 <CR>

" complete line
imap <C-L> <C-X><C-L>

" switching tabs
noremap <c-tab> :tabnext<cr>

" RagTag Mappings
"</<C-X><C-O>
imap <leader>. <C-X>/
imap <leader>, <C-X>-
imap <leader>m <C-X>=

" Rails commands
map <Leader>rm :Rmodel
map <Leader>rc :Rcontroller
map <Leader>rv :Rview

" fuzzy file finder
nnoremap <leader>p :<C-u>FufFile **/<CR>
nnoremap <leader>fb :<C-u>FufBuffer **/<CR>

colorscheme railscasts
set t_Co=256

if has('gui_running')
  " colorscheme cobalt
  colorscheme atom-dark
  " colorscheme railscasts
  " colorscheme molokai
  " set background=dark
  " set transparency=5
  " colorscheme solarized
  " set guifont=Inconsolata:h14
  " set guifont=Monaco:h12
  " set guifont=Inconsolata-dz\ for\ Powerline:h12,5
  let g:airline_powerline_fonts = 1
  set guifont=Sauce\ Code\ Powerline:h12

  set go-=T
  set go-=l
  set go-=L
  set go-=r
  set go-=R

  " Set up the gui cursor to look nice
  set guicursor=n-v-c:block-Cursor-blinkon0
  set guicursor+=ve:ver35-Cursor
  set guicursor+=o:hor50-Cursor
  set guicursor+=i-ci:ver25-Cursor
  set guicursor+=r-cr:hor20-Cursor
  set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon17

  if has("gui_macvim")
      set macmeta
      macmenu &File.New\ Tab key=<nop>
  end

  highlight SpellBad term=underline gui=undercurl guisp=Orange
endif


autocmd BufNewFile,BufRead *_spec.rb  compiler rspec
au! BufRead,BufNewFile *.sass         setfiletype sass
au! BufRead,BufNewFile *.jst          setfiletype html
au! BufNewFile,BufRead *.prawn        setfiletype ruby

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Disable tab for ycm completion
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
