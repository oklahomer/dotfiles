" https://twitter.com/hakuu0/status/282424815330148352
" To avoid getting "Not an editor command: NeoBundleFetch" Error,
" do git config --global core.editor 'vim -c "set fenc=utf-8"'


"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

" plugins on github
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'dagolden/vim-hl-var'
  set updatetime=300
  let g:hlvarhl="ctermbg=green ctermfg=red guifg=#ff0000 guibg=#000000 gui=bold"

NeoBundle 'mattn/gist-vim'
NeoBundle 'Shougo/neocomplcache'
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'perl' : $HOME.'/.vim/dict/perl.dict',
    \ }

"NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'bling/vim-airline'
  let g:airline#extensions#tabline#enabled = 1
  "let g:airline_theme='powerlineish'
  let g:airline_theme='molokai'
  " On OSX wget https://gist.github.com/baopham/1838072/raw/2c0e00770826e651d1e355962e751325edb0f1ee/Monaco%20for%20Powerline.otf
  " and move it to ~/Library/Fonts/
  let g:airline_powerline_fonts = 1
  set laststatus=2
  set noshowmode

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_start_level=2
  let g:indent_guides_guide_size=1
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray

call neobundle#end()

" Required
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"End NeoBundle Scripts-------------------------

syntax on
filetype plugin on
filetype on
set hlsearch
colorscheme zellner

" Highlights trailing spaces
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" □,○などの全角記号をズレなくする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"tabs
set tabstop=4     "An indentation level every four columns
set softtabstop=4
set expandtab     "Convert all tabs typed into spaces
set shiftwidth=4  "Indent/outdent by four columns
set shiftround    "Always indent/outdent to the nearest tabstop

" indentation
set autoindent
" set smartindent

" search/match
set ic " incremental search
set showmatch
set smartcase
set wrapscan

set ruler

" filetype
autocmd BufNewFile,BufRead *.tt   set filetype=html
autocmd BufNewFile,BufRead *.tx   set filetype=html
autocmd BufNewFile,BufRead *.t    set filetype=perl
autocmd BufNewFile,BufRead *.psgi set filetype=perl

set iskeyword+=:

set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

" colors
set t_Co=256

" comment
hi Comment ctermfg=6 cterm=NONE

" allow backspacing over everything in insert mode
set bs=indent,eol,start

" highlight current line
set cursorline
