set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'lervag/vimtex'
    let g:tex_flavor='latexmk'
    " let g:vimtex_view_method='zathura'
    let g:vimtex_view_method='skim'
    " let g:vimtex_quickfix_mode=0
    set conceallevel=1
    let g:tex_conceal='abdmg'
    let g:tex_comment_nospell= 1
    
    "Plugin 'sirver/ultisnips'
    "let g:UltiSnipsExpandTrigger = '<tab>'
    "let g:UltiSnipsJumpForwardTrigger = '<tab>'
    "let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    "let g:UltiSnipsSnippetsDirectories=["/Users/spencerbryngelson/.vim/UltiSnips/"]

    Plugin 'bling/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='solarized'
    let g:airline_solarized_bg='dark'
    let g:airline#extensions#tabline#enabled = 1 
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#hunks#enabled = 0 
    let g:airline#extensions#whitespace#enabled = 0

    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-commentary'
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    Plugin 'terryma/vim-multiple-cursors'

    Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plugin 'junegunn/fzf.vim'

    Plugin 'flazz/vim-colorschemes'
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme darkZ
set t_Co=256

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

syntax on
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set noswapfile
set nobackup
set cursorline
set scrolloff=4
set re=1
set noshowmode
set nocompatible
set hidden

set spelllang=en_us

set wildmode=list:longest
set wildmenu
set wildcharm=<tab>
set lazyredraw

nmap { :bprev<CR>
nmap } :bnext<CR>

nmap gs :setlocal spell<CR>
nmap dw daw

" Remap home row to escape
imap jk <Esc><Esc>
imap kj <Esc><Esc>

cmap jk <C-c>
cmap kj <C-c>

" Remap omnicompletion
imap qqq <C-x><C-o>

" Copy to clipboard

vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

" Move to end of previous word or beginning of next word
noremap H ge
noremap L w

noremap K 10k
noremap J 10j

nnoremap d "_d
xnoremap d "_d
vnoremap d "_d

nnoremap F :FZF<CR>

function! Bye()
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
         :q
     else
         :bdelete
    endif
endfunction
map Q :call Bye()<CR>

function! WriteBye()
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
         :x
     else
         :write|bdelete
    endif
endfunction
map X :call WriteBye()<CR>

map W :w<CR>


" Runs a script that cleans out tex build files whenever I close out of a .tex file.
"	autocmd VimLeave *.tex :!$HOME/Fixed/texclear.sh

" Wrap to previous or next line as needed
set whichwrap+=>,l
set whichwrap+=<,h

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set clipboard=unnamed

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Always display the status line, even if only one window is displayed
set laststatus=2

set confirm
set visualbell
set t_vb=
set mouse=

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=4
set tabstop=4
set expandtab

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

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

set tabpagemax=100
