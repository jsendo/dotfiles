syntax enable
let g:solarized_visibility = "low"
colorscheme solarized

if has("gui_running")
  set background=light
  set nu
else
  set background=dark
endif

set directory=~/.vim/tmp

let g:fuzzy_ignore = "*.log,*.class,gems/gems/**"
let mapleader = ","

nmap <Tab> :FuzzyFinderTextMate<CR>

map <leader>b :FuzzyFinderBuffer<CR>
map <leader>r :FuzzyFinderTextMateRefreshFiles<CR>

set tabstop=2
set shiftwidth=2
set expandtab

