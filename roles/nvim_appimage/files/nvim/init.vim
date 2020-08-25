set nohlsearch
set number
set tabstop=4 shiftwidth=4 expandtab
set wildmode=longest,list,full
set hidden

colorscheme ron
set number

" TODO: I seem to have lost the spellcheck in vim

" TODO: An sshed vi will never be able to copy to an external clipboard
" so this aim should probably be dropped for copy paste
" Default to clipboard
set clipboard=unnamedplus

" Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


" Spell-check for certain files
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" make Y effect to end of line instead of whole line
map Y y$

call plug#begin('~/.config/nvim/plugins')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neovim/nvim-lsp'
call plug#end()

" For the language server to work you must of have done pip install python-language-server

" Ignore the pycodestyle for the leanguage server
lua <<EOF
require'nvim_lsp'.pyls.setup{
  settings = {
    pyls = {
      plugins = {
        pycodestyle = {
          enabled = false; 
          }
        }
      }
    }
  }
EOF

autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
