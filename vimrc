set background=dark
colorscheme desert

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd Filetype python set tabstop=4
  autocmd Filetype python set shiftwidth=4
  autocmd Filetype python set smarttab
  autocmd Filetype python set expandtab
  autocmd Filetype python set softtabstop=0
  autocmd Filetype python set autoindent
  autocmd Filetype python set enc=utf-8
  autocmd Filetype python set keywordprg=pydoc
  autocmd Filetype python set iskeyword=a-z,A-Z,48-57,_,.  

  autocmd Filetype javascript set tabstop=2
  autocmd Filetype javascript set shiftwidth=2
  autocmd Filetype javascript set smarttab
  autocmd Filetype javascript set expandtab
  autocmd Filetype javascript set softtabstop=0
  autocmd Filetype javascript set autoindent
  autocmd Filetype javascript set enc=utf-8  

  autocmd Filetype java set tabstop=4
  autocmd Filetype java set shiftwidth=4
  autocmd Filetype java set smarttab
  autocmd Filetype java set expandtab
  autocmd Filetype java set softtabstop=4
  autocmd Filetype java set autoindent
  autocmd Filetype java set enc=utf-8
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete  

  autocmd Filetype css set tabstop=2
  autocmd Filetype css set shiftwidth=2
  autocmd Filetype css set smarttab
  autocmd Filetype css set expandtab
  autocmd Filetype css set softtabstop=2
  autocmd Filetype css set autoindent
  autocmd Filetype css set enc=utf-8

  autocmd Filetype java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
  autocmd Filetype java nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
  autocmd Filetype java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>  

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set linebreak
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals
set foldmethod=syntax
set foldlevelstart=1
set nocp
set completeopt=menu
set wildignore=*.o,*.pyc,*.pyo
set ruler
set wildmode=longest,list,full
set wildmenu
set nobackup
set nowritebackup

" Don't use Ex mode, use Q for formatting
map Q gq
map <C-6> :e#<CR>
map! <C-6> <Esc>:e#<CR>

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=1 Stab call Stab(<args>)
function! Stab(size)
  if a:size > 0
    let &l:sts = a:size
    let &l:ts = a:size
    let &l:sw = a:size
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

