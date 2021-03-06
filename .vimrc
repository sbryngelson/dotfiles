set nocompatible

filetype off

let haveVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let haveVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
if haveVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif

" set rtp+=~/.vim/bundle/Vundle.vim

" call vundle#begin()

Plugin 'lervag/vimtex'
" Plugin 'itchyny/lightline.vim'
Plugin 'plasticboy/vim-markdown'
" Pair with npm install -g git+https://github.com/hcgatewood/livedown
Plugin 'shime/vim-livedown'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'Konfekt/vim-sentence-chopper'
Plugin 'arnoudbuzing/wolfram-vim'
Plugin 'scrooloose/syntastic'
Plugin 'danro/rename.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'lukelbd/vim-scrollwrapped'

call vundle#end()
filetype plugin indent on


" Livedown

" should markdown preview get shown automatically upon opening markdown buffer
nmap <leader>p :LivedownToggle<CR>
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 1337
" the browser to use, can also be firefox, chrome or other, depending on your executable
" let g:livedown_browser = "chrome"

" Vim markdown
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_math = 1


" Wolfram language syntax highlighting
autocmd BufNewFile,BufRead *.wl set syntax=wl
autocmd BufNewFile,BufRead *.wls set syntax=wl

" Sentence chopper 
let g:latexindent = 0
nmap <leader>w <plug>(ChopSentences)ip<CR>
xmap <leader>w <plug>(ChopSentences)ip<CR>
vmap <leader>w <plug>(ChopSentences)i<CR>
" nnoremap <leader>w gqip

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_quiet_messages = { 'regex': [ 
    \ '\Vis not a GNU Fortran module',
    \ '\Vmpi.mod'
    \ ] }
" let g:syntastic_quiet_messages = {"!level":  "errors"}
" let g:syntastic_check_on_open = 1
" let g:syntastic_ignore_files = ['preamble.tex', 'tikz_preamble.tex']

let g:syntastic_fortran_compiler_options = '-ffree-line-length-none'
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 4])
    endif
endfunction

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>e :SyntasticToggleMode<CR> :SyntasticCheck<CR> 

" FZF
let $FZF_DEFAULT_COMMAND='fdd -t f -H'
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Airline
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1 
" let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 0 
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% %3l/%L:%3v'


" Lightline
" let g:lightline = {
"       \ 'colorscheme': 'jellybeans',
"       \ 'active': {
"       \   'right': [ [ 'lineinfo' ],
"       \              [ 'percent' ]
"       \            ]
"       \ }
"       \ }


" Vimtex
let g:tex_flavor='latexmk'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:tex_comment_nospell= 1
set conceallevel=1

" vifm
" let g:vifm_embed_term = 0

" Ultisnips
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:UltiSnipsSnippetsDirectories=["$HOME/.vim/UltiSnips/"]

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Don't wrap partial words
set formatoptions+=w

syntax on
colorscheme SHB
set t_Co=256

set noswapfile
set number relativenumber
set nobackup
set cursorline
set re=1
set nocompatible
set hidden
set spelllang=en_us
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
set smartindent
set nostartofline
set notimeout ttimeout ttimeoutlen=200
set tabstop=4
set shiftwidth=0
set softtabstop=-1
set expandtab
set whichwrap+=>,l
set whichwrap+=<,h
set tabpagemax=100
set splitbelow splitright
set undofile
set undodir=~/.vim/undodir
set numberwidth=2
set autoread
set scrolloff=10
set display=lastline
set wrap
set linebreak 
set wildmenu
set wildmode=longest:full,full
set wildcharm=<tab>
" set laststatus=2
set noshowmode



" Navigate splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Replace all
nnoremap <leader>r :%s//gc<Left><Left><Left>

" Remap spellcheck
" nmap <leader>s :setlocal spell<CR>
nnoremap <leader>s :call SpellToggle()<CR>

function! SpellToggle()
    if &spell
        setlocal spell!
    else
        setlocal spell
    endif
endfunction

" Remap omnicompletion
imap qqq <C-x><C-o>

" Remap multiline edit
vmap <leader>m <C-n>

" Remap indent in visual mode such that it reselects lines
vnoremap > >gv
vnoremap < <gv

" Remap FZF
nnoremap F :Files<CR>


" Remap delete around a word
nmap dw daw

" Map Ctrl-A to escape
noremap <C-a> <Nop>
noremap <C-a> <Esc><Esc>
xnoremap <C-a> <Esc><Esc>

noremap <C-A> <Nop>
noremap <C-A> <Esc><Esc>
xnoremap <C-A> <Esc><Esc>


" Remap tab switch
nmap <S-Tab> :bprev<CR>
nmap <Tab> :bnext<CR>

" Remap copy to clipboard
" vnoremap <C-c> :w !pbcopy<CR><CR>
" noremap <C-v> :r !pbpaste<CR><CR>
vnoremap <C-c> "*y

" Remap home row to escape
imap jk <Esc><Esc>
imap kj <Esc><Esc>
cmap jk <C-c>
cmap kj <C-c>

" Move to end of previous word or beginning of next word
noremap H ge
noremap L w

" Move ten lines down (by rows)
noremap K 10gk
noremap J 10gj

nnoremap j gj
nnoremap k gk

" Remap redo
noremap U <C-r>

" Make delete really delete
nnoremap d "_d
xnoremap d "_d
vnoremap d "_d

nnoremap x "_x
xnoremap x "_x
vnoremap x "_x

" Center window when searching
nnoremap n nzz
nnoremap N Nzz

" Don't enter insert mode after inserting a new empty line
nnoremap o o<Esc>
nnoremap O O<Esc>

" Move line down
nnoremap m i<CR><ESC>

" Use spaces and back spaces in normal mode
nnoremap <Space> i<Space><Right><ESC>
nnoremap <bs> <Left>x

" Map (redraw screen) to turn off search highlighting until next search
nnoremap <leader>d :nohl<CR><C-L>

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

if &term =~ '256color'
    set t_ut=
endif

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
