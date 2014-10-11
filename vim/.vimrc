" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Let me hide modified buffers
set hidden

" highlight search matches
set hlsearch

" To clear highlighted matches until next search
" nnoremap <esc> :noh<return><esc>

" Change the leader key from \ to ,
let mapleader=","

" Change replace view
set cpoptions+=$

" To use ,. and ,m (:bn => :bnext; :bp => :bprevious)
map <Leader>. :bnext<CR>
map <Leader>m :bprevious<CR>

set encoding=utf-8

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles :)
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'benmills/vimux'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'ervandew/supertab'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-scripts/ZoomWin'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'vim-scripts/VimClojure'
NeoBundle 'vim-scripts/mediawiki.vim'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'fatih/vim-go'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'rking/ag.vim'

NeoBundleCheck

" Airplane
let g:airline_powerline_fonts = 1

" Set terminal title to filename
set title

" Switch syntax highlighting on.
syntax on

" Enable loading the plugin files for specific file types.
filetype plugin on

" Enable loading the indent file for specific file types.
filetype indent on

" Copy indent from current line when starting a new line.
set autoindent

" disable usage of cursor keys within insert mode, removes delay when pressing
" <Shift><o> immediately after <Esc>.
set noesckeys

" Fix the delete key
:fixdel

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" Controls how many columns Vim uses when <Tab> is pressed in insert mode.
set softtabstop=2

" When set, hitting <Tab> in insert mode will produce the appropriate
" number of spaces.
set expandtab

" How many columns text is indented with reindent operations (>> & <<) and
" automatic C-style indentation
set shiftwidth=2

" When on, a <Tab> in front of a line inserts balnks according to 'shiftwidth'
set smarttab

au FileType sh setl sw=2 sts=2 et

" Influences the working of <BS>, <Del>, <CTRL-W>, <CTRL-U> in Insert mode.
" This is a list of items, separated by commas. Each item allows a way to
" backspace over something:
" value     effect
" indent    allow backspacing over autoindent
" eol       allow backspacing over line breaks (join lines)
" start     allow backspacing over the start of insert; CTRL-W and CTRL-U stop
"           once at the start of insert.
set backspace=indent,eol,start

" Maximum width of text that is being inserted. A longer line will be broken
" after whitespace to get this width. A zero value disables this.
set textwidth=79

" When set to dark, Vim will try to use colors that look good on a dark
" background.
set background=dark

" Set the color scheme.
colorscheme twilight256
" colorscheme solarized

" Print the line number in front of each line.
set number

" While typing a search command, show where the pattern, as it was typed so far,
" When a bracket is inserted, briefly jump to the matching one. A Beep is given
" if there is no match.
set showmatch

" Highlight the screen line of the cursor with CursorLine.
" set cursorline " cursorcolumn

" View the changes you have made to a buffer since the file was loaded
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

set laststatus=2

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
" To 'auto-trim' trailing whitespace
"autocmd BufWritePre     *.rb :call TrimWhiteSpace()

" Nerdtree
" Toggle NERDTree on C-n
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Put NERDTree on the right side
let g:NERDTreeWinPos = 'right'

" Save Tweak
map qw :w<CR>

" Vimux
map qq :VimuxRunLastCommand<CR>
map qe :VimuxPromptCommand<CR>

" GitGutter
" Toggle GitGutter on C-g
map <C-g> :GitGutterToggle<CR>

" Stop vim-gitgutter running eagerly
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" CTRLp
map <C-b> :CtrlPBuffer<CR>

" 80 character column
set colorcolumn=80

" Zenmode
let g:goyo_width=120
nnoremap <silent> <leader>z :Goyo<cr>
nnoremap <silent> <leader>x :noh<cr>

" Store swapfiles somewhere else
set directory=$HOME/.vim/swap//

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : '#(~/.tmux/plugins/tmux-battery/scripts/battery_percentage.sh) Battery',
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#h'}

set mouse=a
