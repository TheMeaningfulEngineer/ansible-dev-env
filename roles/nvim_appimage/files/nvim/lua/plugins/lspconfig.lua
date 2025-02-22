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
    local lspconfig = require("lspconfig")

    -- Lua language server setup
    lspconfig.lua_ls.setup{
      settings = {
        Lua = {
          workspace = {
            preloadFileSize = 1000, -- 1MB limit
            ignoreDir = { ".git", "node_modules" }
          }
        }
      }
    }

    lspconfig.basedpyright.setup{
      settings = {
        basedpyright = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true
          }
        }
      }
    }
  end
}

