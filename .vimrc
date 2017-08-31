set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'burke/matcher'

call vundle#end()            " required
filetype plugin indent on    " required

set term=screen-256color

colorscheme beekai

set number " set line number
syntax enable " enable syntax processing
set tabstop=4 	" number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
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

autocmd BufWritePre * :%s/\s\+$//e	" remove whitespaces on save

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

" change netrw configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_browse_split = 4

