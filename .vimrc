set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'burke/matcher'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'AlessandroYorba/Despacio'       "Color scheme
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'python-mode/python-mode'
Plugin 'beigebrucewayne/Turtles'
Plugin 'albertorestifo/github.vim'      " Light color scheme
Plugin 'vim-airline/vim-airline-themes'
Plugin 'othree/html5.vim'
Plugin 'alvan/vim-closetag'
Plugin 'pangloss/vim-javascript'

call vundle#end()            " required
filetype plugin indent on    " required

" change where swp and backup files are stored
set undodir=~/.vim/.undo/
set backupdir=~/.vim/backup/
set directory=~/.vim/.swp/

set term=screen-256color

" set colorscheme
colorscheme turtles

" set powerline colorscheme
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1

" remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e

set number " set line number
syntax enable " enable syntax processing
set tabstop=8 	" number of visual spaces per tab
set softtabstop=8  " number of spaces in tab when editing
set smarttab smartindent expandtab
set shiftwidth=2 	" ident to corresepond to a single tab
set cursorline	" highlight current line
set wildmenu	" visual autocomplete for command menu
set showmatch	" highlight matching parentheses

" Search related stuff
set incsearch	" search as characters are enteres
set hlsearch	" highlight search matches

" turn off search highlight after enter
nnoremap <leader><space> :nohlsearch<CR>

filetype indent on " load file-type specific indent files
filetype on		"let vim detect the filetype

" reload vimrc config
map <leader>s :source ~/.vimrc<CR>

set hidden
set history=100

" function to remove highlighted white space and save

" switch to previously viewed file
nnoremap <leader><leader> :e#<CR>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" integrate silver searcher with matcher for better search results
if executable('matcher')
    let g:ctrlp_match_func = { 'match': 'GoodMatch' }

    function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

      " Create a cache file if not yet exists
      let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
      if !( filereadable(cachefile) && a:items == readfile(cachefile) )
        call writefile(a:items, cachefile)
      endif
      if !filereadable(cachefile)
        return []
      endif

      " a:mmode is currently ignored. In the future, we should probably do
      " something about that. the matcher behaves like "full-line".
      let cmd = 'matcher --limit '.a:limit.' --manifest '.cachefile.' '
      if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
        let cmd = cmd.'--no-dotfiles '
      endif
      let cmd = cmd.a:str

      return split(system(cmd), "\n")

    endfunction
end

" bind K to search for the word under the cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" map cmd-p to ctr-p fuzzy search
nnoremap <D-p> <C-p>

"  change netrw configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_browse_split = 4

" map the escape key to various key combinations
inoremap jj <Esc>
inoremap jk <Esc>

" control screen split and navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" add some support for tab completion
set wildmode=longest,list,full
set wildmenu

" change clipboard config in visual mode
vnoremap <cr> "+y<cr>
vnoremap <BS> "+p<cr>

" set bar at a textwidth of 100 chars
set colorcolumn=101

" allow vim access to the system clipboard
set clipboard=unnamed

" python stuff
let python_highlight_all = 1

