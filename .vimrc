set nocompatible
set nowrap
syntax on
set encoding=UTF-8
"set cursorline
set number relativenumber

"""" START vim-plug Configuration 
call plug#begin('~/.local/share/nvim/plugged')

" Utility
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'wesQ3/vim-windowswap'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim'
" Plug 'tpope/vim-commentary'
" Plug 'godlygeek/tabular'
" Plug 'jeetsukumaran/vim-buffergator'

" Generic Programming Support 
Plug 'honza/vim-snippets'
Plug 'Townk/vim-autoclose'
Plug 'tobyS/vmustache'
Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'
Plug 'Yggdroot/indentline'
Plug 'sheerun/vim-polyglot'

" Markdown / Writting
"Plug 'reedes/vim-pencil'
"Plug 'tpope/vim-markdown'
"Plug 'LanguageTool'

" Git Support
"Plug 'kablamo/vim-git-log'
"Plug 'gregsexton/gitv'
"Plug 'tpope/vim-fugitive'

" PHP Support
Plug 'lvht/phpcd.vim'
Plug 'tobyS/pdv'

" Theme / Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'daylerees/colour-schemes'
Plug 'ryanoasis/vim-devicons'
Plug 'edkolev/tmuxline.vim'

call plug#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Vim-Airline Configuration
"let g:airline#extensions#tabline#enabled = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ayu_mirage'

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

" Neomake settings
autocmd! BufWritePost * Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']

" Vim-PDV Configuration 
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

" Markdown Syntax Support
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Vim-Supertab Configuration
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Settings for Writting
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:languagetool_jar  = '/opt/languagetool/languagetool-commandline.jar'

" Vim-pencil Configuration
"augroup pencil
"  autocmd!
"  autocmd FileType markdown,mkd call pencil#init()
"  autocmd FileType text         call pencil#init()
"augroup END

" Vim-UtilSnips Configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Vim-Test Configuration
let test#strategy = "vimux"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

let g:user_emmet_leader_key = ' '
let mapleader="\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>

" Change <Esc> to jj to exit vim
imap jj <Esc><Esc>

" noremap <left>
noremap ' ''<left>
noremap " ""<left>    
noremap ( ()<left>
noremap [ []<left>
noremap { {}<left>
noremap {<CR> {<CR>}<ESC>O
noremap {;<CR> {<CR>};<ESC>O

" Make Use Of HJKL Key
nnoremap <Up> :echomsg "use k"<cr>
nnoremap <Down> :echomsg "use j"<cr>

" Quickly change buffer
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" Set cursorline
:hi CursorLine   cterm=NONE ctermbg=Black ctermfg=white guibg=Black guifg=white
:hi CursorColumn cterm=NONE ctermbg=0 ctermfg=white guibg=Black guifg=white


" Enable devicons
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

set conceallevel=1

" prevent misstype
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))

" Enable python support
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

" Enable neocomplete at start
let g:deoplete#enable_at_startup = 1

" Indent Line setting
"let g:indentLine_char='▏'
let g:indentLine_char=' '

" Onedark color
let g:onedark_terminal_italics=1

" :colorscheme onedark
set t_Co=256

" Customize color scheme
:hi CursorLine ctermbg=235
:hi CursorColumn ctermbg=232
:hi Normal ctermbg=NONE
