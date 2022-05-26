require "user.plugin"
require "user.telescope"
require "user.cmp"

-- Colorscheme [it's a command not a config :/]
vim.cmd('colorscheme desert')

-- Tab and auto ident conf
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Autocomplete in default bash style
vim.opt.wildmode='longest,list'

-- Allow hidden buffers (otherwise all open buffers have to be shown all the time)
vim.opt.hidden = true

-- Allows clicking to select a window
vim.opt.mouse = 'a'

-- Don't highlight searches
vim.opt.hlsearch = false

-- Default to copying to clipboard
vim.opt.clipboard = 'unnamedplus'

-- Show numbers on the side but don't show it for the terminal
vim.opt.number = true
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end
})


-- Run spellcheck only for certaint file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "gitcommit"},
    callback = function()
        vim.opt_local.spell = true
    end
})

-- Highlight whitespace
-- Lua tip - [[ ]] are for string literals and don't need escaping
vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
vim.cmd([[match ExtraWhitespace /\s\+$/]])
