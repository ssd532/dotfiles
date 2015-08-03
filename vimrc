" For Vundle
" Refer https://github.com/VundleVim/Vundle.vim
set nocompatible                " be iMproved, required
filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'altercation/vim-colors-solarized'   " colorsheme
Plugin 'scrooloose/nerdtree'                " project drawer
Plugin 'jistr/vim-nerdtree-tabs'            " helps nerdtree
Plugin 'bling/vim-airline'                  " Status and tab bar
Plugin 'scrooloose/syntastic'               " syntax checker
Plugin 'xolox/vim-misc'                     " dependency for vim-easytags don't know what else it does
Plugin 'xolox/vim-easytags'                 " show tags in code
Plugin 'majutsushi/tagbar'                  " generate tags in code
Plugin 'kien/ctrlp.vim'                     " fuzzy search for files etc.
Plugin 'airblade/vim-gitgutter'             " show git changes etc in left side gutter
Plugin 'tpope/vim-fugitive'                 " manage git
Plugin 'Raimondi/delimitMate'               " auto close parantheses and quotes
Plugin 'Valloric/YouCompleteMe'             " powerful autocomplete
Plugin 'scrooloose/nerdcommenter'           " commenting shortcuts
Plugin 'rstacruz/sparkup'                   " html macro. fast html coding. like m4 for html
Plugin 'luochen1990/rainbow'                " colorful parantases
Plugin 'mtth/scratch.vim'                   " scratch pad
Plugin 'sjl/gundo.vim'                      " graphical undo
Plugin 'Yggdroot/indentLine'                " Indentation lines vertical bars
Plugin 'marijnh/tern_for_vim'               " Javascript linter which can attach to ycm
Plugin 'rking/ag.vim'                       " frontend for silversearcher
Plugin 'pangloss/vim-javascript'            " Improved JS indentation and syntax support e.g. html within js
Plugin 'xolox/vim-session'                  " manage vim sessions
Plugin 'elzr/vim-json'                      " highlight key value etc.
Plugin 'bronson/vim-trailing-whitespace'    " remove trailing whitespaces (:FixWhitespace)
Plugin 'tpope/vim-surround'                 " quoting/parantesizing made simple
Plugin 'SirVer/ultisnips'                   " snippet manager
Plugin 'honza/vim-snippets'                 " vim snippets
Plugin 'matthewsimo/angular-vim-snippets'   " angular js snippets
Plugin 'othree/javascript-libraries-syntax.vim' " javascript libraries syntax
Plugin 'burnettk/vim-angular'               " AngularJS with vim, jump to controllers services etc.

call vundle#end()               " required
filetype plugin indent on       " required

" Vundle end

filetype on                     " Remeber we had disabled it for Vundle
syntax enable                   " Syntax highlighting

" solarized colorscheme config
set t_Co=256
set background=dark             " force vim to use 256 colors
let g:solarized_termcolors=256  " use solarized 256 fallback
colorscheme solarized           " use this colorscheme

" General settings
let mapleader=","               " use , as leader instead of \
filetype indent on              " load flietype specific indent files
set backspace=indent,eol,start  " for consistent backspace behaviour
set ruler                       " show current line number, column number etc.
set number                      " show line number
set showcmd                     " show what you are typing in command mode
set incsearch                   " to move cursor to matching string while typing the search pattern
set hlsearch                    " highlight all search pattern matches
set wrap                        " wrap lines
set textwidth=80
set colorcolumn=80
set autoindent                  " autoindent (shortcut is =)
set copyindent                  " copy the previous indentation on autoindenting / alternative for paste
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hidden                      " I will take care of my hidden buffers
set scrolloff=2                 " always display n number of lines below and above cursor
set cursorline                  " highlight current line
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set backupdir=~/.vim/backup//   " backup files location (files with ~ prefix)
set directory=~/.vim/swp//      " swapfile location. The double tailing slash will store files using full paths
cmap w!! w !sudo tee % >/dev/null   " use w!! to use sudo to save file
nmap <silent> <leader>/ :nohlsearch<CR>    " Tired of clearing highlighted searches by searching for “ladf”

" Refer http://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
set exrc " source .vimrc file if it present in working
set secure " since vim will source any local vimrc, must use secure to restrict unsafe commands to run"

" Tabs and spaces
" Refer http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=4     " how many columns a tab counts for
set shiftwidth=4  " how many columns text is indented with the reindent operations (<< and >>)
set softtabstop=4 " how many columns vim uses when you hit Tab in insert mode
set expandtab	  " hitting Tab in insert mode will produce the appropriate number of spaces.

" Show invisibles
" Refer http://vimcasts.org/episodes/show-invisibles/

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
set list " set list to show invisibles by default

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Invisible character colors
" NonText is Newline
" SpecialKey is Tab
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_detect_paste=1 " let airline detect paste
let g:airline#extensions#tabline#buffer_nr_show = 1 " show buffer number
let g:airline_theme='powerlineish'

" NERDTree settings
map <Leader>n <plug>NERDTreeTabsToggle<CR> " Toggle NERDTree window

" syntactic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" activate rainbow parantheses
let g:rainbow_active = 1

" gitgutter settings
let g:gitgutter_enabled = 1


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
map <c-p><c-b> :CtrlPBuffer<CR>
map <c-p><c-m> :CtrlPMRUFiles<CR>

" delimitMate automatic CR
let g:delimitMate_expand_cr = 1


" ultisnip
" to make ultisnip work with youcompleteme
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" youcompleteme
let g:ycm_key_list_select_completion = ['<Down>']
