set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/vim-ruby/vim-ruby.git'
Plugin 'git://github.com/tpope/vim-rails.git'
Plugin 'git://github.com/tomtom/tcomment_vim.git'
Plugin 'git://github.com/vim-scripts/IndexedSearch.git'
Plugin 'git://github.com/tpope/vim-fugitive.git'
Plugin 'git://github.com/tpope/vim-git.git'
Plugin 'git://github.com/mattn/emmet-vim.git'
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
Plugin 'git://github.com/kien/ctrlp.vim.git'
Plugin 'git://github.com/JazzCore/ctrlp-cmatcher.git'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'git://github.com/vim-scripts/matchit.zip'
Plugin 'git://github.com/godlygeek/tabular.git'
Plugin 'git://github.com/mileszs/ack.vim.git'
Plugin 'git://github.com/vim-scripts/L9.git'
Plugin 'git://github.com/kchmck/vim-coffee-script.git'
Plugin 'git://github.com/tpope/vim-haml.git'
Plugin 'git://github.com/nono/vim-handlebars.git'
Plugin 'git://github.com/tpope/vim-markdown.git'
Plugin 'git://github.com/briancollins/vim-jst.git'
Plugin 'git://github.com/pangloss/vim-javascript.git'
Plugin 'git://github.com/scottmcginness/vim-jquery.git'
Plugin 'git://github.com/tpope/vim-ragtag.git'
Plugin 'git://github.com/othree/html5.vim.git'
Plugin 'git://github.com/vim-scripts/simplefold.git'
Plugin 'git://github.com/scrooloose/syntastic.git'
Plugin 'git://github.com/tpope/vim-endwise.git'
Plugin 'git://github.com/reinh/vim-makegreen.git'
Plugin 'git://github.com/danro/rename.vim.git'
Plugin 'git://github.com/airblade/vim-rooter.git'
Plugin 'git://github.com/skwp/vim-rspec.git'
Plugin 'git://github.com/vim-scripts/taglist.vim.git'
Plugin 'git://github.com/vim-scripts/BufOnly.vim.git'
Plugin 'git://github.com/vim-scripts/bufexplorer.zip.git'
Plugin 'git://github.com/maxbrunsfeld/vim-yankstack.git'
Plugin 'git://github.com/jgdavey/vim-railscasts.git'
Plugin 'git://github.com/ricardovaleriano/vim-github-theme.git'
Plugin 'git://github.com/vim-scripts/summerfruit256.vim.git'
Plugin 'git://github.com/bling/vim-airline.git'
Plugin 'git://github.com/morhetz/gruvbox.git'
Plugin 'git://github.com/tomasr/molokai.git'
Plugin 'git://github.com/noahfrederick/vim-hemisu.git'
Plugin 'git://github.com/skwp/greplace.vim.git'
Plugin 'git://github.com/tpope/vim-unimpaired.git'
Plugin 'git://github.com/dterei/VimCobaltColourScheme.git'
Plugin 'git://github.com/Valloric/YouCompleteMe.git'
Plugin 'git://github.com/SirVer/ultisnips.git'
Plugin 'git://github.com/honza/vim-snippets.git'

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

" Easy buffer navigation
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
  colorscheme cobalt
"   colorscheme molokai
"   colorscheme solarized
  set background=dark
"   set background=dark
"   set transparency=5
"   set guifont=Inconsolata:h13
"   set guifont=Monaco:h11
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
