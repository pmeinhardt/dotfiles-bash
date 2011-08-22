
" .vimrc - paul meinhardt


" general

  set nocompatible             " explicitly get out of vi-compatible mode
  set noerrorbells             " silence


" highlighting

  set showmatch                " show matching brackets
  "syntax on                    " syntax highlighting


" text formatting

"  - indentation

  set autoindent               " indent according to previous line
  set smartindent              " guess new line indentation level

  set expandtab                " no real tabs please! toggle w/ :set expandtab!
  set softtabstop=2            " hitting tab or backspace (re)moves 2 spaces
  set shiftwidth=2             " auto-indent depth
  set tabstop=4                " real tabs are 4 spaces

"  - auto-completion

  inoremap ( ()<Left>
  inoremap { {}<Left>
  inoremap [ []<Left>
  inoremap ' ''<Left>
  inoremap " ""<Left>

"  - non-printable characters

  set list                     " toggle with :set list!
  set listchars=tab:▸\ ,eol:¬  " chars for invisibles

"  - deleting

  set backspace=indent,eol,start " make backspace more flexible


" navigation

  set ruler
  set scrolloff=3              " keep at least 3 lines above/below


" plugins

  "filetype on                  " enable filetype detection
  "filetype indent on           " enable filetype-specific indenting
  "filetype plugin on           " enable filetype-specific plugins
