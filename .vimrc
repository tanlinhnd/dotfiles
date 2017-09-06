set ff=unix

" Cancel backup
set nobackup
set nowritebackup
set noswapfile
set noundofile

" Autoload vimrc after edit
" autocmd! bufwritepost .vimrc source %

set history=50
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

" set guifont=Menlo:h14
set guifont=Fira\ Code:h12

" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

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

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

colorscheme neodark
let g:neodark#solid_vertsplit = 1 " default: 0

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Use tab with text block
vmap <Tab> >gv
vmap <S-Tab> <gv

"""""""""""""""""""""""""KEY MAPPING""""""""""""""""""""

" Switching buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

let g:buffergator_suppress_keymaps = 1

" F2 Switch display line number
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>

" Remove highlight
map <F3> :nohl<CR>

" F4 Show TagList
nmap <silent> <F4> :TagbarToggle<CR>

" F5 Nerdtree
map <F5> :NERDTreeToggle<CR>

" F6 Go Build
map <F6> :!go build -o bin/`basename "$PWD"`<CR>

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

" map qq to escape
:imap qq <Esc>

" map Ctrl-w to close buffer
:nmap <C-w> :bd<CR>
" npa Ctrl-q to quit
:nmap <C-q> :q!<CR>

nnoremap <Left> :echoe "Use h. Plz"<CR>
nnoremap <Right> :echoe "Use l. Plz"<CR>
nnoremap <Up> :echoe "Use k. Plz"<CR>
nnoremap <Down> :echoe "Use j. Plz"<CR>

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
" Color schema

let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')

" Multi select
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_play_open_browser = 0
let g:go_disable_autoinstall = 0

autocmd FileType go nmap <leader>b  <Plug>(go-build)
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

" NerdCommenter
let g:NERDSpaceDelims=1

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_show_hidden = 1
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" indentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

let g:tagbar_type_go = {  
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }

" Skip the check of neovim module
let g:python3_host_skip_check = 1

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1

" neosnippet
let g:neosnippet#enable_completed_snippet = 1
let g:autocomplete_flow#insert_paren_after_function = 0

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '/tmp/json_directory'

" gitgutter
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_max_signs=500

let NERDTreeShowHidden=1

" ale vim
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python' : ['flake8'],
            \}

" set vue filetype
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
