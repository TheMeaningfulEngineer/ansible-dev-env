return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/playground", -- Treesitter debugging
    "nvim-treesitter/nvim-treesitter-textobjects", -- Text objects support
    { "catppuccin/nvim", name = "catppuccin" } -- Theme integration
  },
  build = function()
    require("nvim-treesitter.install").update { with_sync = true }
  end,
  config = function()
    require('nvim-treesitter.configs').setup {
      modules = {}, -- Explicitly defined to satisfy Lua LSP
      ensure_installed = {
        "lua", "python", "markdown", "markdown_inline",
        "bash", "comment", "dockerfile", "json", "bitbake"
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      playground = { enable = true },

      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Jump to next object
          keymaps = {
            ["ac"] = "@block.outer", -- Select around block (includes backticks)
            ["ic"] = "@block.inner", -- Select inside block (excludes backticks)
          },
        }
      },
    }
    vim.api.nvim_create_autocmd("BufWinEnter", {
      callback = function()
        vim.cmd("normal! zx")
      end,
    })
  end
}

