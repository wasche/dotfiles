" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off

" setup vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'

" Dash documentation integration
" provides :Dash family of commands
" @see https://github.com/rizzatti/dash.vim
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

Bundle 'groenewege/vim-less'

filetype plugin indent on " needed by vundle

set background=dark
colorscheme desert


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Use syntax folding for most filetypes, but open all folds by default
  autocmd Syntax c,cpp,vim,xml,html,xhtml,java,javascript setlocal foldmethod=syntax
  autocmd Syntax c,cpp,vim,xml,html,xhtml,java,javascript,perl normal zR

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

  autocmd Filetype ruby set tabstop=2
  autocmd Filetype ruby set shiftwidth=2
  autocmd Filetype ruby set smarttab
  autocmd Filetype ruby set expandtab
  autocmd Filetype ruby set softtabstop=0
  autocmd Filetype ruby set autoindent
  autocmd Filetype ruby set enc=utf-8

  autocmd Filetype sh set tabstop=2
  autocmd Filetype sh set shiftwidth=2
  autocmd Filetype sh set smarttab
  autocmd Filetype sh set expandtab
  autocmd Filetype sh set softtabstop=0
  autocmd Filetype sh set autoindent
  autocmd Filetype sh set enc=utf-8

  autocmd Filetype zsh set tabstop=2
  autocmd Filetype zsh set shiftwidth=2
  autocmd Filetype zsh set smarttab
  autocmd Filetype zsh set expandtab
  autocmd Filetype zsh set softtabstop=0
  autocmd Filetype zsh set autoindent
  autocmd Filetype zsh set enc=utf-8

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

  autocmd Filetype html set tabstop=2
  autocmd Filetype html set shiftwidth=2
  autocmd Filetype html set smarttab
  autocmd Filetype html set expandtab
  autocmd Filetype html set softtabstop=2
  autocmd Filetype html set autoindent
  autocmd Filetype html set enc=utf-8

  autocmd Filetype velocity set tabstop=2
  autocmd Filetype velocity set shiftwidth=2
  autocmd Filetype velocity set smarttab
  autocmd Filetype velocity set expandtab
  autocmd Filetype velocity set softtabstop=2
  autocmd Filetype velocity set autoindent
  autocmd Filetype velocity set enc=utf-8

  autocmd Filetype xml set tabstop=2
  autocmd Filetype xml set shiftwidth=2
  autocmd Filetype xml set smarttab
  autocmd Filetype xml set expandtab
  autocmd Filetype xml set softtabstop=2
  autocmd Filetype xml set autoindent
  autocmd Filetype xml set enc=utf-8

  autocmd Filetype haml set tabstop=2
  autocmd Filetype haml set shiftwidth=2
  autocmd Filetype haml set smarttab
  autocmd Filetype haml set expandtab
  autocmd Filetype haml set softtabstop=2
  autocmd Filetype haml set autoindent
  autocmd Filetype haml set enc=utf-8

  autocmd Filetype jade set tabstop=2
  autocmd Filetype jade set shiftwidth=2
  autocmd Filetype jade set smarttab
  autocmd Filetype jade set expandtab
  autocmd Filetype jade set softtabstop=2
  autocmd Filetype jade set autoindent
  autocmd Filetype jade set enc=utf-8

  autocmd Filetype stylus set tabstop=2
  autocmd Filetype stylus set shiftwidth=2
  autocmd Filetype stylus set smarttab
  autocmd Filetype stylus set expandtab
  autocmd Filetype stylus set softtabstop=2
  autocmd Filetype stylus set autoindent
  autocmd Filetype stylus set enc=utf-8

  autocmd Filetype less set tabstop=2
  autocmd Filetype less set shiftwidth=2
  autocmd Filetype less set smarttab
  autocmd Filetype less set expandtab
  autocmd Filetype less set softtabstop=2
  autocmd Filetype less set autoindent
  autocmd Filetype less set enc=utf-8

  autocmd Filetype java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
  autocmd Filetype java nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
  autocmd Filetype java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>  

  autocmd Filetype ant set tabstop=2
  autocmd Filetype ant set shiftwidth=2
  autocmd Filetype ant set smarttab
  autocmd Filetype ant set expandtab
  autocmd Filetype ant set softtabstop=2
  autocmd Filetype ant set autoindent
  autocmd Filetype ant set enc=utf-8

  autocmd Filetype make set tabstop=4
  autocmd Filetype make set shiftwidth=4
  autocmd Filetype make set smarttab
  autocmd Filetype make set noexpandtab
  autocmd Filetype make set autoindent

  autocmd filetype go set tabstop=4
  autocmd filetype go set shiftwidth=4
  autocmd filetype go set noexpandtab
  autocmd filetype go set autoindent
  autocmd filetype go set smarttab
  autocmd filetype go set enc=utf-8

  autocmd Filetype sql set tabstop=2
  autocmd Filetype sql set shiftwidth=2
  autocmd Filetype sql set smarttab
  autocmd Filetype sql set expandtab
  autocmd Filetype sql set softtabstop=2
  autocmd Filetype sql set autoindent
  autocmd Filetype sql set enc=utf-8

  autocmd Filetype markdown set tabstop=2
  autocmd Filetype markdown set shiftwidth=2
  autocmd Filetype markdown set smarttab
  autocmd Filetype markdown set expandtab
  autocmd Filetype markdown set softtabstop=2
  autocmd Filetype markdown set autoindent
  autocmd Filetype markdown set enc=utf-8

  autocmd Filetype r set tabstop=2
  autocmd Filetype r set shiftwidth=2
  autocmd Filetype r set smarttab
  autocmd Filetype r set expandtab
  autocmd Filetype r set softtabstop=2
  autocmd Filetype r set autoindent
  autocmd Filetype r set enc=utf-8

  autocmd Filetype hql set tabstop=2
  autocmd Filetype hql set shiftwidth=2
  autocmd Filetype hql set smarttab
  autocmd Filetype hql set expandtab
  autocmd Filetype hql set softtabstop=2
  autocmd Filetype hql set autoindent
  autocmd Filetype hql set enc=utf-8

else

  set autoindent		" always set autoindenting on
  set foldmethod=syntax
  set foldlevelstart=20

endif " has("autocmd")

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set autowrite		" Automatically save before commands like :next and :make
set linebreak
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes) in terminals
set nocp
set completeopt=menu
set wildignore=*.o,*.pyc,*.pyo
set ruler
set title
set scrolloff=3
set visualbell          " make the bell visual
syntax on

set backspace=indent,eol,start

" backups/swap
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
"set nobackup
"set nowritebackup
set noswapfile

let mapleader = ","

" Don't use Ex mode, use Q for formatting
map Q gq
map <C-6> :e#<CR>
map! <C-6> <Esc>:e#<CR>

" key mappings
nnoremap ' `
nnoremap ` '
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>w :bw<CR>
nnoremap <leader>P :set paste!<CR>:set paste?<CR>
nnoremap <leader>b :set binary noeol<CR>
nnoremap <leader>m :! make<CR>

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" highlight search terms
set hlsearch
set incsearch		" Incremental search
nmap <silent> <leader>h :silent :nohlsearch<CR>

" catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" GUndo
function! MyGundoToggle()
  let g:gundo_width = &columns / 4
  GundoToggle
endfunction
nnoremap <leader>u :call MyGundoToggle()<CR>
let g:gundo_help = 0

" miniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModeSelTarget = 1

" better change word
:nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nmap pw :inoremap <lt>Space> <lt>Space><lt>Esc>:iunmap <lt>lt>Space><lt>CR><CR> cw
nmap p$ :inoremap <lt>CR> <lt>CR><lt>Esc>:iunmap <lt>lt>CR><lt>CR><CR> c$

" better tab completion
set wildmenu
set wildmode=longest,list,full

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
