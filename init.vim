let g:python_host_prog = '/Users/jd/neovim-python/env2/bin/python'
let g:python3_host_prog = '/Users/jd/neovim-python/env3/bin/python' 
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:onedark_termcolors=256
" let g:airline_theme='onedark'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/jd/.dein.d//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/jd/.dein.d/')

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
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('sheerun/vim-polyglot')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('joshdick/onedark.vim')
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-rails')
call dein#add('majutsushi/tagbar')
call dein#add('kchmck/vim-coffee-script')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('neomake/neomake')
call dein#add('chase/vim-ansible-yaml')
call dein#add('junegunn/vim-easy-align')
call dein#add('godlygeek/tabular')
call dein#add('907th/vim-auto-save')

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
let g:deoplete#enable_at_startup=1
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
set incsearch
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
	
let g:neomake_sass_sasslint_maker = {
        \ 'exe': 'sass-lint',
        \ 'args': ['--no-exit', '-v', '--format=compact'],
        \ 'errorformat':
            \ '%E%f: line %l\, col %c\, Error - %m,' .
            \ '%W%f: line %l\, col %c\, Warning - %m',
        \ } 
let g:neomake_sass_enabled_makers = ['sasslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['mri']
autocmd BufWritePost,BufEnter * Neomake
autocmd InsertChange,TextChanged * update | Neomake

" Folding
set foldcolumn=2
set foldmethod=syntax
set foldlevel=5
