"dein.vim setting starts--------------------------
let s:dein_dir = '$HOME/.vim/bundles'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
execute 'set runtimepath +=' . s:dein_repo_dir

" Required:
call dein#begin(s:dein_dir)

" Let dein manage dein
" Required:
call dein#add(s:dein_repo_dir)

let s:dein_toml_file = $HOME . '/.vim/config/dein.toml'
if empty(glob(s:dein_toml_file))
  echo "No dein.toml found at " . s:dein_toml_file . ". Skipping."
else
  call dein#load_toml(s:dein_toml_file, {'lazy': 0})
endif

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"dein.vim setting ends--------------------------

" colorscheme pablo
colorscheme shades_of_purple

" □,○などの全角記号をズレなくする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"tabs and spaces
set tabstop=4     "An indentation level every four columns
set softtabstop=4
set expandtab     "Convert all tabs typed into spaces
set shiftwidth=4  "Indent/outdent by four columns
set shiftround    "Always indent/outdent to the nearest tabstop

autocmd Filetype vim set sts=2 ts=2 sw=2 expandtab

" search/match
set ic " incremental search
set showmatch
set smartcase
set wrapscan
set hlsearch " highlight search matches

" let j & k move by rows rather than lines
nnoremap j gj
nnoremap k gk

" highlight current line
set cursorline

" allow backspacing over everything in insert mode
set bs=indent,eol,start
