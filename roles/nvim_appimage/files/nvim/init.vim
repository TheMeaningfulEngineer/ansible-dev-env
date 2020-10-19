set nohlsearch
set number
set tabstop=4 shiftwidth=4 expandtab
set wildmode=longest,list,full
set hidden

colorscheme ron
set number
set mouse=a

" TODO: I seem to have lost the spellcheck in vim

" TODO: An sshed vi will never be able to copy to an external clipboard
" so this aim should probably be dropped for copy paste
" Default to clipboard
set clipboard=unnamedplus

" Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd TermOpen * setlocal nonumber norelativenumber

" Spell-check for certain files
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" make Y effect to end of line instead of whole line
map Y y$

nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>

