set number
set shiftwidth=4
set tabstop=4
set noexpandtab
set softtabstop=4
set textwidth=0
set wrapmargin=0
set wrap
set linebreak
set noswapfile
set autoindent
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%41 %3p%% of %L"

set ignorecase
set smartcase
set incsearch
set hlsearch
set wildmenu
set backspace=indent,eol,start

"remaps
nnoremap <silent> <Esc><Esc> :if v:hlsearch | nohlsearch | endif<CR>
map <C-x> <Nop>

set omnifunc=ale#completion#OmniFunc

let g:ale_signature_help_enabled = 1
let g:ale_lsp_suggestions = 1
let g:ale_set_balloons = 1
let g:ale_set_highlights = 1
let g:ale_completion_enabled = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_lint_on_save = 0

