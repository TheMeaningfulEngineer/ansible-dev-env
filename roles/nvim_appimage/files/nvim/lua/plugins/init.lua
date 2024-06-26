
return {
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins

  -- Treesitter
  -- Some workaround for installing with packer
  -- (https://github.com/nvim-treesitter/nvim-treesitter/issues/3135)
  { "navarasu/onedark.nvim", as = "onedark" },
  "nvim-treesitter/playground",

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
}
