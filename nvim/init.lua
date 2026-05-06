-- Clone Lazy and add it to nvim path
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

-- This is an example for a single plugin
--require("lazy").setup({
--  {
--    "neovim/nvim-lspconfig", -- Plugin repository
--    opts = {                 -- Plugin options ( require("plugin_name").setup(opts) )
--      servers = { pyright = {} },
--    },
--  }
--})

-- config when you need extra setup beyond opts
-- You manually invoke the setup call of the plugin
-- {
--  "neovim/nvim-lspconfig",
--  opts = { servers = { pyright = {} } },
--  config = function(plugin, opts)
--    require("lspconfig").pyright.setup(opts.servers.pyright)
--    print("LSP setup complete!")
--  end
--}


vim.o.exrc = true  -- Enable per-project configurations
vim.o.secure = true  -- Prevents unsafe commands from running automatically

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
vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy --foreground --type text/plain",
    ["*"] = "wl-copy --foreground --type text/plain",
  },
  paste = {
    ["+"] = "wl-paste --no-newline",
    ["*"] = "wl-paste --no-newline",
  },
  cache_enabled = 1,
}

-- Show numbers on the side but don't show it for the terminal
vim.opt.number = true
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end
})

vim.cmd('colorscheme catppuccin')

vim.g.have_nerd_font = false

-- Run spellcheck only for certaint file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "gitcommit"},
    callback = function()
        vim.opt_local.spell = true
    end
})


-- Highlight active window in a split
local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
vim.api.nvim_set_hl(0, "NormalNC", { bg = normal_bg and normal_bg - 0x101010 })

-- Remove unused mappings so they don't polute my suggestion space
vim.keymap.del("n", "gx")       -- removes gx after Lazy loads keymaps
vim.keymap.del("n", "gO")       -- removes gx after Lazy loads keymaps
