"------------------------------------------------------------------------------
" ░█▀▀░▀█▀░█▄█░█▀█░▀░█▀▀░░░█░█░▀█▀░█▄█░█▀▄░█▀▀
" ░█░█░░█░░█░█░█░█░░░▀▀█░░░▀▄▀░░█░░█░█░█▀▄░█░░
" ░▀▀▀░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░░░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" VUNDLE CONFIGURATIONS
"------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'klen/python-mode'
Plugin 'Shougo/neocomplete.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'chrisbra/csv.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------------------------------------------------------
" GENERAL CONFIGURATIONS
"------------------------------------------------------------------------------
syntax on
colorscheme Monokai-chris
set ignorecase
set number
" Space is my leader.
let mapleader="\<Space>"
if has("gui_running")
    set guifont=Monaco_for_Powerline:h14
    " do not display right scrollbar
    set guioptions=R
    set linespace=-2
    set transparency=0
endif
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
imap jj <Esc>


"------------------------------------------------------------------------------
" AIRLINE CONFIGURATIONS
"------------------------------------------------------------------------------
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='sol'

"------------------------------------------------------------------------------
" PYTHON-MODE CONFIGURATIONS
"------------------------------------------------------------------------------
let g:pymode_rope=0
let g:pymode_lint_on_fly=1

"------------------------------------------------------------------------------
" NEOCOMPLETE.VIM CONFIGURATIONS
"------------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
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

"------------------------------------------------------------------------------
" JEDI-VIM CONFIGURATIONS
"------------------------------------------------------------------------------
" disable select first popup
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#popup_select_first = 0
let g:jedi#use_splits_not_buffers = "left"

"------------------------------------------------------------------------------
" CTRLP CONFIGURATIONS
"------------------------------------------------------------------------------
" Ignore files. 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


"------------------------------------------------------------------------------
" EASYMOTION CONFIGURATIONS
"------------------------------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `trigger{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `trigger{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap <Leader>f <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


"------------------------------------------------------------------------------
" ULTISNIPS CONFIGURATIONS
"------------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"------------------------------------------------------------------------------
" TAGBAR CONFIGURATIONS
"------------------------------------------------------------------------------
nmap <Leader>t :TagbarToggle<CR>
