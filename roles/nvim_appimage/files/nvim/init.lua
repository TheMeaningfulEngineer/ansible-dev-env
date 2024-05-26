-- Lazy plugin manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- The plugins are located in ~/.config/nvim/lua/plugins
require('lazy').setup('plugins')


-- This is the old way how I configured plugin. 
-- Haven't migrated that to the lazy dir structire
-- require "user.cmp"
-- require "user.treesitter"



-- Ignore case if searching for lowercase words
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Tab and auto ident conf
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Autocomplete in default bash style
vim.opt.wildmode='longest,list'

-- Create the new split to the right not to the left
vim.opt.splitright = true

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
