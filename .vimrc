let $PATH = "~/.pyenv/shims:".$PATH

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

NeoBundle 'mattn/webapi-vim' " Required for gist-vim
" Run `git config --global github.user GITHUB_USERNAME` before initialization.
NeoBundle 'mattn/gist-vim'
  " Private by default
  let g:gist_show_privates = 1
  let g:gist_post_private = 1

  " Open gist in new splitted window, so current editing buffers stay.
  let g:gist_edit_with_buffers = 1

  " Allow update if and only if :w! . Set 1 to allow :w .
  let g:gist_update_on_write = 2

  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 1

NeoBundle 'vim-scripts/Align'


NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
if neobundle#is_installed('neocomplete')
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'perl' : $HOME.'/.vim/dict/perl.dict',
    \ }
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
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
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
endif

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

NeoBundle 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_start_level=2
  let g:indent_guides_guide_size=1
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray

NeoBundle 'tpope/vim-fugitive' " Required for gitv
NeoBundle 'gregsexton/gitv'

NeoBundle 'davidhalter/jedi-vim'
  " Don't allow 'completeopt+=preview' on auto config
  let g:jedi#auto_vim_configuration = 0
" -------------------------------------------------------------------------
" Avoid confliction w/ pythoncomplete
  let g:jedi#auto_initialization = 1
  let g:jedi#rename_command = "<leader>R"
  let g:jedi#popup_on_dot = 1
  let g:jedi#popup_select_first = 0
  autocmd FileType python let b:did_ftplugin = 1
"" -------------------------------------------------------------------------

NeoBundle 'fs111/pydoc.vim'

" If necessary, `cd .vim/bundle/pyflakes-vim' and git submodule ....
" TODO quickfix display
NeoBundle 'kevinw/pyflakes-vim'
  let g:pyflakes_use_quickfix = 1

"" when '"vimproc_linux64.so" is not found.' occurres, `cd ~/.vim/bundle/vimproc` and `make`
"NeoBundle "osyo-manga/vim-watchdogs", {
"  \ "depends": [
"  \   "Shougo/vimproc", "thinca/vim-quickrun", "dannyob/quickfixstatus",
"  \   "osyo-manga/shabadou.vim", "cohama/vim-hier"
"  \ ]}
"if ! empty(neobundle#get("vim-watchdogs"))
"  let g:watchdogs_check_BufWritePost_enable = 1
"  let g:watchdogs_check_CursorHold_enables = {
"    \   "python"     : 1,
"    \}
"
"  if !exists("g:quickrun_config")
"    let g:quickrun_config = {}
"  endif
"
"  " TODO Handling with virtualenv like below case
"  " 'The `pyflakes' command exists in these Python versions: FOO'
"  let s:flake8 = system('flake8 --version 2>/dev/null')
"    if s:flake8 != ""
"      let g:quickrun_config["python/watchdogs_checker"] = {
"        \ "type" : "watchdogs_checker/flake8",
"        \ "outputter" : "quickfix",
"        \ }
"  endif
"
"  autocmd InsertLeave,TextChanged *.py :WatchdogsRun
"
"  " No longer required. https://github.com/osyo-manga/vim-watchdogs/issues/9
"  " call watchdogs#setup(g:quickrun_config)
"endif

NeoBundle 'thinca/vim-localrc'

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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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

" let j & k move by rows rather than lines
nnoremap j gj
nnoremap k gk

" incremental search
set incsearch

" Change color for syntax check
highlight clear SpellBad
highlight SpellBad term=bold cterm=bold guibg=Green ctermbg=Green
