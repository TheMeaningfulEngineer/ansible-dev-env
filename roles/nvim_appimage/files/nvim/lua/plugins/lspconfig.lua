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
require("lspconfig").lua_ls.setup{
  settings = {
    Lua = {
      workspace = {
        preloadFileSize = 1000, -- 1MB limit
        ignoreDir = { ".git", "node_modules" }
      }
    }
  }
} end
}

