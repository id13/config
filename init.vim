let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:onedark_termcolors=256
" let g:airline_theme='onedark'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.dein.d//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.dein.d/')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('tpope/vim-repeat')
call dein#add('junegunn/seoul256.vim')
call dein#add('junegunn/vim-easy-align')
call dein#add('tpope/vim-surround')
call dein#add('ConradIrwin/vim-bracketed-paste')
call dein#add('zchee/deoplete-jedi')
call dein#add('fishbullet/deoplete-ruby')
call dein#add('carlitux/deoplete-ternjs')
call dein#add('jiangmiao/auto-pairs')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
call dein#add('ctrlpvim/ctrlp.vim')
" call dein#add('ludovicchabant/vim-gutentags')
call dein#add('sheerun/vim-polyglot')
call dein#add('joshdick/onedark.vim')
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-abolish')
call dein#add('majutsushi/tagbar')
call dein#add('kchmck/vim-coffee-script')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('neomake/neomake')
call dein#add('chase/vim-ansible-yaml')
call dein#add('junegunn/vim-easy-align')
call dein#add('godlygeek/tabular')
call dein#add('907th/vim-auto-save')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('mattn/emmet-vim')
call dein#add('alvan/vim-closetag')
call dein#add('chrisbra/Colorizer')
call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
call dein#add('leafgarland/typescript-vim')
call dein#add('ianks/vim-tsx')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
" Enable plugins
call deoplete#enable()
autocmd FileType markdown let g:deoplete#enable_at_startup=0

syntax on
colorscheme onedark

set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

set regexpengine=1
autocmd CompleteDone * pclose

set number 
set tabstop=2  		" number of visual spaces interpreted for each tab
set softtabstop=2      	" number of spaces inserted when using tab
set expandtab  		" expand tabs to spaces
set shiftwidth=2        " When indenting with > / <
set smartindent

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

"searching
set ignorecase
set magic
set smartcase
set nohlsearch

" autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
autocmd CursorHold * update


" Better defaults
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
set showmatch           " Show matching brackets.
set noerrorbells        " No beeps.
set noshowmode
set noruler
" Map the leader key to SPACE
let mapleader="\<SPACE>"

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

runtime macros/matchit.vim

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Close buffer but not the window
" http://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
function! BufferDelete()
    if &modified
        echohl ErrorMsg
        echomsg "No write since last change. Not closing buffer."
        echohl NONE
    else
        let s:total_nr_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

        if s:total_nr_buffers == 1
            bdelete
            echo "Buffer deleted. Created new buffer."
        else
            bprevious
            bdelete #
            echo "Buffer deleted."
        endif
    endif
endfunction

nnoremap <leader>w :call BufferDelete()<cr>

let g:airline_theme='simple'
hi Normal ctermbg=none
set autoread
nmap <leader>t :TagbarToggle<CR>
au CursorHold * checktime 
" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif
" Fugitive
set diffopt+=vertical
nmap <leader>gd :Gdiff<cr>

" Wild copy and paste
set clipboard+=unnamedplus
" Auto leave pastemode when leaving insert
autocmd InsertLeave * :set nopaste
" Set permanent undodir
set undodir=~/.config/nvim/undodir
set undofile

" Neomake settings
	
" let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
" let g:neomake_typescript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

let g:neomake_sass_sasslint_maker = {
        \ 'exe': 'sass-lint',
        \ 'args': ['--no-exit', '-v', '--format=compact'],
        \ 'errorformat':
            \ '%E%f: line %l\, col %c\, Error - %m,' .
            \ '%W%f: line %l\, col %c\, Warning - %m',
        \ } 
let g:neomake_sass_enabled_makers = ['sasslint']
let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_typescript_eslint_maker = {
    \ 'args': ['--format=compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#',
    \ 'cwd': '%:p:h',
    \ 'output_stream': 'stdout',
    \ }
 let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
 let g:neomake_typescript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

let g:neomake_typescript_enabled_makers = ['eslint']
" let g:neomake_ruby_enabled_makers = ['mri']
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_mypy_maker = {
    \ 'args': ['--ignore-missing-imports'],
    \ 'errorformat':
        \ '%E%f:%l: error: %m,' .
        \ '%W%f:%l: warning: %m,' .
        \ '%I%f:%l: note: %m',
    \ }
let g:neomake_python_enabled_makers = ['flake8', 'mypy']
autocmd BufWritePost,BufEnter * Neomake
autocmd InsertChange,TextChanged * update | Neomake

" Folding
" set foldcolumn=2
" set foldmethod=syntax
" set foldlevel=5

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

:let g:colorizer_auto_filetype='scss,jsx,js,sass,css,html'

:set mouse=a

" Ctrlp
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:32,results:32'

" Cursor
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=n:blinkon1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ag<SPACE>
:tnoremap <Esc> <C-\><C-n>
