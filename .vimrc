call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
" ^^^ This requires patched fonts
Plug 'tpope/vim-eunuch'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-vividchalk'
Plug 'groenewege/vim-less'
Plug 'uarun/vim-protobuf'
Plug 'derekwyatt/vim-scala'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/trailing-whitespace'
Plug 'vim-scripts/Align'
Plug 'Valloric/YouCompleteMe', { 'commit': '6e2afb635ef1e9c7cfd7d84cd8997320ee6b605e' }
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'davidzchen/vim-bazel'
Plug 'tweekmonster/gofmt.vim'
Plug 'google/vim-jsonnet'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()
let $PATH.=':' . $HOME . '/.nix-profile/bin'
"make thee comma the leader, and swap the it with ctrl-e
nnoremap <C-e> ,
let mapleader = ","

"make it easier to go in command mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"winow nav
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

"search for the current word
noremap <F4> <ESC>:AckFromSearch!<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"make the vim search regex more like perl
nnoremap / /\v
vnoremap / /\v

"jj breaks out of insert mode
imap jj <Esc>l

""abbrevation: %% -> current dir of file
cabbr <expr> %% expand('%:p:h')

" have Vim jump to the last position when
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set ignorecase		" Do case insensitive matching
set hidden             " Hide buffers when they are abandoned
set number		"line numbers
set hlsearch		"Highlight search
set fileencodings=utf-8
set encoding=utf-8
set wildmode=list:longest
:set cpoptions+=$	"show a dollar sign when doing a change command
set nowrap		"dont word wrap
set smartindent
set cursorline		"show where the cursor is
set ttyfast
set gdefault		"all s// commands are global
set expandtab
set tabstop=2
set shiftwidth=2
set completeopt =menu,menuone,longest "get rid of scratch pad
set wildignore+=*.git,*.jpg,tags,*.pyc,*/node_modules/*
set magic	"make regexs more perl like
set nomodeline
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc " Suffixes that get lower priority when doing tab completion for filenames.
set nowb
set colorcolumn=81
set backupdir=/tmp
set directory=/tmp

autocmd FileType cpp setlocal noexpandtab tabstop=4 shiftwidth=4

"ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 30
let g:ctrlp_dont_split = ''
let g:ctrlp_arg_map = 0
let g:ctrlp_open_multi = '2'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = '/Users/chrismcbride/bin/rg --files %s'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
noremap <C-O>   :CtrlPBuffer<CR>

"syntastic options
"This requires jsonlint and jshint
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_ballons = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_coffee_checkers = ['coffeelint']

let g:syntastic_cpp_compiler_options = '-std=c++0x'
let g:syntastic_cpp_compiler = "clang++"

"airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline_section_x = ''
let g:airline_section_y = ''

"nerdtree
noremap <silent> <F2> :NERDTreeToggle<CR>
au VimEnter * highlight clear SignColumn
let NERDTreeWinSize=40
let NERDTreeMinimalUI=1

"ack
let g:ackprg = '/Users/chrismcbride/bin/rg --vimgrep --no-heading'

"youcompleteme
let g:ycm_show_diagnostics_ui = 0
