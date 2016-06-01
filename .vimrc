set nocompatible

filetype off " off required for Vundle
filetype indent on

"set <F2> o\item<Esc>o$$<Esc>o<Esc>o$$<Esc>li
set background=dark
syntax on
colo kolor
set t_Co=256

"""""""""""""""""""""""
"" Own stuff
"""""""""""""""""""""""
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

"" Pathogen setup ""
"call pathogen#infect()
"call pathogen#helptags()

"""""""""""""""""""""""
"" Vundle setup
"""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Vim addons via Vundle ""
" let Vundle mamage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'PotatoesMaster/i3-vim-syntax'

Plugin 'scrooloose/syntastic'

Plugin 'scrooloose/nerdtree'


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" No longer in use, mostly just use 'f' or similar commands
"Plugin 'easymotion/vim-easymotion'

"Plugin 'Valloric/YouCompleteMe'

Plugin 'Shougo/neocomplete.vim'

Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

Plugin 'shinokada/dragvisuals.vim'

Plugin 'jplaut/vim-arduino-ino'

Plugin 'sudar/vim-arduino-syntax'

Plugin 'xuhdev/vim-latex-live-preview'

Plugin 'townk/vim-autoclose'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""
"" From dougblack.io "A Good Vimrc"
"""""""""""""""""""""""""""""""""""

"" Folding ""
set foldenable		" Enable folding
set foldlevelstart=10	" Open most folds by default
" set foldnestmax		" 10 nested fold max " This command does not work or is not accepted in .vimrc
set foldmethod=indent	" Fold based on indent level
" space open/closes folds
nnoremap <space> za

"" Movement ""
" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Move to beginning/end of line
"nnoremap B ^
"nnoremap E $

" $/^ Doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

" leader is comma
let mapleader=","

"" stuff from www.vimconfig.com
"" general

set number 		" Enable line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=--> 	" Wrap-broken line prefix
"set textwidth=100 	" Line wrap (number of cols)
set showmatch 		" Highlight motionsatching brace

set smartcase 		" Enable smart-case searcharch
set ignorecase 		" Always case-insensitive
set incsearch 		" Searches for strings incrementally
set hlsearch 		" Highlight all search results

set autoindent 		" Auto-indent new lines
set shiftwidth=4 	" Number of auto-indent spaces
set smartindent 	" Enable smartart-indent
set smarttab 		" Enable smart-tabs
set softtabstop=4 	" Number of spaces per Tab

set wildmenu		" Visual autocomplete for command menu

" Make sure Vim returns to the same line when you reopen a file
augroup line_return
    au!
    au BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   execute 'normal! g`"zvzz' |
	\ endif
augroup END

"""""""
"" Own stuff
""""""""
" change non-arrow movement keys to fit a Danish keyboard when using machine typeing

"" Show Trailing Whitespaces

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Some setup for Kolor colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:kolor_italic=1                    " Enable italic. Default: 1
let g:kolor_bold=1                      " Enable bold. Default: 1
let g:kolor_underlined=0                " Enable underline. Default: 0
let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin specific stuff
""  Plugins installed and works
""	-EasyMotion
""	-NERD_tree
""	-Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""

""" EasyMotion """""""""""""""""""""""""""""""""""""""
"
"let g:EasyMotion_do_mapping = 0 " Disable default mappings
"
"" Bi-directional find motion
"" Jump to anywhere you want with minimal keystrokes, with just one key binding.
"" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
"" or
"" `s{char}{char}{label}`
"" Need one more keystroke, but on average, it may be more comfortable.
""nmap s <Plug>(easymotion-s2)
"
"" Turn on case insensitive feature
"let g:EasyMotion_smartcase = 1
"
"" JK motions: Line motions
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""
"" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""
"" Nerd_tree
"""""""""""""""""""""""""""""""""

" help text to NERD_tree
" :help NERD_tree.txt
"
"

""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""
	"Set the AirlineTheme as raven
:let g:airline_theme='raven'
"	"Shows Airline 'bar' all the time
set laststatus=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neocompl/NeoSnippet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Disable AutoComplPop.
"let g:acp_enableAtStartup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
	\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>	neocomplete#undo_completion()
inoremap <expr><C-l>	neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]  *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]  *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""
"" Drag visuals
""""""""""""""""""""""""""""""""""""""

runtime plugin/dragvisuals.vim

vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving...
 let g:DVB_TrimWS = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim Arduino Ino
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_arduino_map_keys = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-latex-live-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" The command to initialize the live preview is: LLPStartPreview


" set another pdf viewer than default (default being Evince)
"let g:livepreview_previewer = 'your_pdf_viewer'
