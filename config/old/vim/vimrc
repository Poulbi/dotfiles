" Heh

filetype plugin indent on

syntax on

set runtimepath+=~/.config/vim,~/.config/vim/after
set viminfo+=n~/.config/vim/viminfo
" Plugins 
" s;https://github.com/\(.*\);Plug '\1';
call plug#begin('~/.vim/plugged')
Plug 'LordTlasT/live-server'
Plug 'tpope/vim-endwise'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'yuezk/vim-js'
call plug#end()

set termguicolors " amazing!
set signcolumn=yes " GitGutter
set updatetime=100

set tabstop=4 shiftwidth=4 " Turn tab to spaces
set backspace=2 backspace=indent,eol,start " Turn backspaces into tabspaces
set incsearch " Incremental search
set clipboard=unnamed " Use system primary clipboard

set number " Set (absolute) line numbers
set relativenumber " make them hybrid
set showmatch " Show matching bracket
set showcmd " Show partial command in status line
set laststatus=2 " show more status/file info
set cursorline " Highlight line at cursor
set ruler " Show cursor and progress in file
set wildmenu " Show command options (autocomplete)

set mouse= "nomouse
set encoding=utf-8 " Set encoding
set history=200 " Keep a lot more command history

""""""""""""COLORSCHEME"""""""""""""""""""""""
colo nord
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
"""""""""""""""""""""""""""""""""""""""""""""

let &t_SI = "\e[6 q" " Insert cursor
let &t_EI = "\e[2 q" " Normal cursor

let ghregex='\(^\|\s\s\)\zs\.\S\+' " Start netrw with dotfiles hidden
let g:netrw_list_hide=ghregex

let g:indentLine_fileTypeExclude = ['dashboard'] " No indentline on dashboard

""""""""""""""""""" FUNCTIONS AND COMMANDS
" Force quit faster
command Q execute 'quit!'

" autocomment z80
autocmd FileType z80 setlocal commentstring=;\ %s

" Return to last edit position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

augroup nvim_term
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * :setlocal nonumber norelativenumber signcolumn=no
augroup END

" Toggle status bar
let s:hidden_all = 0
function! ToggleHiddenAll()
  if s:hidden_all  == 0
    let s:hidden_all = 1
    set noshowmode noruler nonu nornu laststatus=0 noshowcmd signcolumn=no
  else
    let s:hidden_all = 0
    set showmode ruler nu rnu laststatus=2 showcmd signcolumn=yes
  endif
endfunction


""""""""""""""""""""" MAPPINGS """"""""""""""""""""""""
let mapleader = ' '

" Windows
noremap <A-h> <C-W>h
noremap <A-j> <C-W>j
noremap <A-k> <C-W>k
noremap <A-l> <C-W>l
noremap <A-o> <C-W>o
nnoremap <C-H> :call ToggleHiddenAll()<CR>

" Closing brackets and quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" goto buffer
nnoremap gb :buffers<CR>:buffer<Space>
