filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'lervag/vimtex'
    Plugin 'bling/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-commentary'
    Plugin 'terryma/vim-multiple-cursors'
    " Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Plugin 'junegunn/fzf.vim'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'kien/ctrlp.vim'
    "Plugin 'sirver/ultisnips'
call vundle#end()            " required
filetype plugin indent on    " required

" CtrlP
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_max_files = 200

" Airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1 
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 0 
let g:airline#extensions#whitespace#enabled = 0

" Vimtex
let g:tex_flavor='latexmk'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:tex_comment_nospell= 1
set conceallevel=1

" Ultisnips
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:UltiSnipsSnippetsDirectories=["/Users/spencerbryngelson/.vim/UltiSnips/"]

" Nerdtree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

syntax on
colorscheme SHB

set t_Co=256
set nocompatible
set noswapfile
set number relativenumber
set nobackup
set cursorline
set scrolloff=4
set re=1
set noshowmode
set nocompatible
set hidden
set spelllang=en_us
set wildmode=longest,list,full
set wildcharm=<tab>
" set lazyredraw
set confirm
set visualbell
set noerrorbells
set t_vb=
set mouse=
set hlsearch
set showcmd
set ignorecase
set smartcase
set clipboard=unnamed
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set notimeout ttimeout ttimeoutlen=200
set shiftwidth=4
set tabstop=4
set expandtab
set whichwrap+=>,l
set whichwrap+=<,h
set tabpagemax=100
set splitbelow splitright


" Replace all
nnoremap <leader>r :%s//gc<Left><Left><Left>

" Remap spellcheck
nmap <leader>s :setlocal spell<CR>

" Remap omnicompletion
imap <leader>c <C-x><C-o>

" Remap multiline edit
vmap <leader>m <C-n>

" Remap CtrlP
nnoremap F :CtrlP<CR>

" Remap delete around a word
nmap dw daw

" Remap home row to escape
imap jk <Esc><Esc>
imap kj <Esc><Esc>
cmap jk <C-c>
cmap kj <C-c>

" Remap tab switch
nmap { :bprev<CR>
nmap } :bnext<CR>

" Remap copy to clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

" Remap paragraph wrapping
nnoremap <leader>w gqip

" Move to end of previous word or beginning of next word
noremap H ge
noremap L w
noremap K 10k
noremap J 10j

" Make delete really delete
nnoremap d "_d
xnoremap d "_d
vnoremap d "_d

" Use spaces in normal mode
nnoremap <Space> i<Space><Right><ESC>

nnoremap <bs> <Left>x

" Map (redraw screen) to turn off search highlighting until next search
nnoremap <C-L> :nohl<CR><C-L>

function! Bye()
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
         :q
     else
         :bdelete
    endif
endfunction

function! WriteBye()
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
         :x
     else
         :write|bdelete
    endif
endfunction

" Modified exit commands
map Q :call Bye()<CR>
map X :call WriteBye()<CR>
map W :w<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

set numberwidth=2
