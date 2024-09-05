return {
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins

  -- Treesitter
  -- Some workaround for installing with packer
  -- (https://github.com/nvim-treesitter/nvim-treesitter/issues/3135)
  "nvim-treesitter/playground",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        treesitter = true,
        markdown = true,
      },
    },
  },
  "dhruvasagar/vim-zoom",
  "qpkorr/vim-bufkill",
  "karoliskoncevicius/vim-sendtowindow",
}
