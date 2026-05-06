return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    }
  },
  config = function()
    -- This executes the command doesn't actually import anything
    require("lsp") -- Loads `lua/lsp/init.lua`, which loads all LSPs
  end
}

