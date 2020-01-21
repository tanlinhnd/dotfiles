set ff=unix

" Cancel backup
set nobackup
set nowritebackup
set noswapfile
set noundofile

" Set encoding UTF-8
set encoding=UTF-8


" Autoload vimrc after edit
autocmd! bufwritepost .vimrc source %

set history=100
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

set backspace=2

set autoindent
set smartindent

set autoread
set autowrite

" Set cursorline
set cursorline

" It is convenient to temporarily fold away (hide) parts of your file, leaving only an outline of the major parts visible.
set fdm=indent

" Default to expand
set foldlevel=99

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable using mouse
set mouse=c

" Make it obvious where 80 characters is
set textwidth=80

" Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

set guifont=Fira\ Code:h13


" Numbers
set number
set numberwidth=2

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Disable preview deoplete
set completeopt-=preview

" Copy to clipboard
set clipboard=unnamed

if $TMUX == ''
    set clipboard+=unnamed
endif

set lazyredraw

filetype plugin indent on

" Open Syntax highlighting
syntax enable

" Turn on color syntax highlighting
syntax on

set termguicolors

if filereadable(expand("~/.config/nvim/vim.bundles"))
    source ~/.config/nvim/vim.bundles
endif

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" bind SPC instead of \. like emacs
let mapleader = "\<Space>"

" Use tab with text block
vmap <TAB> >gv
vmap <S-TAB> <gv

"""""""""""""""""""""""""KEY MAPPING""""""""""""""""""""

" Switching buffer
nnoremap <Leader><TAB> :bprevious<CR>

let g:buffergator_suppress_keymaps = 1

" F2 Switch display line number
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>

" Remove highlight
map <F3> :nohl<CR>

" F4 Show TagList
nmap <silent> <F4> :TagbarToggle<CR>

" F5 Nerdtree
map <Leader>ft :NERDTreeToggle<CR>

" Tabijand Shift-Tab in Normal mode and Visual mode
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" Quicker window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" C-j instead of C-n
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" map qq to escape
:imap qq <Esc>

" map Ctrl-w to close buffer
:nmap <Leader>bd :bd<CR>

nnoremap <Left> :echoe "Use h. Plz"<CR>
nnoremap <Right> :echoe "Use l. Plz"<CR>
nnoremap <Up> :echoe "Use k. Plz"<CR>
nnoremap <Down> :echoe "Use j. Plz"<CR>


" Search file in current directory
nnoremap <Leader>pf :FZF<CR>
" Search content in current buffer
nnoremap <Leader>ps :BLines<CR>
" List of buffers
nnoremap <Leader>bb :Buffers<CR>
" Save buffer
nnoremap <Leader>fs :w<CR>
" Split vertical
nnoremap <Leader>w/ :vsplit<CR>
nnoremap <Leader>w- :split<CR>

"""""""""""""""""""""""""PLUGIN CONFIGURATION""""""""""""""""""""

" airline
let g:airline_section_y = '%{strftime("%Y-%m-%d %H:%M")}'
" Open tabline
let g:airline#extensions#tabline#enabled = 1
" Tabline in the current buffer at both ends of the separated characters
let g:airline#extensions#tabline#left_sep = ' '
" Tabline does not activate the separation of both ends of the buffer character
let g:airline#extensions#tabline#left_alt_sep = '|'
" Tabline in the buffer display number
let g:airline#extensions#tabline#buffer_nr_show = 1
" coc-nvim
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Color schema
color neodark

let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')

" Multi select
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'

" NerdCommenter
let g:NERDSpaceDelims=1

" FZF
set rtp+=/usr/bin/fzf
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" indentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" let g:python_host_prog = '/Users/tanlinh/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog = '/Users/tanlinh/.pyenv/versions/neovim3/bin/python'

noremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" neosnippet
let g:neosnippet#enable_completed_snippet = 1
let g:autocomplete_flow#insert_paren_after_function = 0

" gitgutter
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_max_signs=500

" Coc.nvim
autocmd FileType json syntax match Comment +\/\/.\+$+
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:webdevicons_enable_startify = 1
