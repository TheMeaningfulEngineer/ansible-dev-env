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

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins

  -- Treesitter
  -- Some workaround for installing with packer
  -- (https://github.com/nvim-treesitter/nvim-treesitter/issues/3135)
  {
    "nvim-treesitter/nvim-treesitter",
    build = function() require("nvim-treesitter.install").update { with_sync = true } end
  },
  { "navarasu/onedark.nvim", as = "onedark" },
  "nvim-treesitter/playground",

  -- Telescope
  "nvim-telescope/telescope.nvim",
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  "dhruvasagar/vim-zoom",
  "qpkorr/vim-bufkill",
  "karoliskoncevicius/vim-sendtowindow",

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",

  -- snippets
  "L3MON4D3/LuaSnip", -- snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use
})



