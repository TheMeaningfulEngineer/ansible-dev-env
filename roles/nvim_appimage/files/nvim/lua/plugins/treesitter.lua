return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "catppuccin/nvim", name = "catppuccin" }
  },
  build = function() 
    require("nvim-treesitter.install").update { with_sync = true } 
  end,
  config = function()
    -- Setup nvim-treesitter
    require('nvim-treesitter.configs').setup {
      -- one of "all", "maintained" (parsers with maintainers),
      -- or a list of languages
      ensure_installed = { "lua", "python", "markdown", "markdown_inline", "bash", "comment" },
      playground = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    }

    -- Setup catppuccin colorscheme
    require("catppuccin").setup({
      integrations = {
        treesitter = true,
        markdown = true,
      },
    })

    -- Apply catppuccin colorscheme only for Markdown files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.cmd("colorscheme catppuccin")
      end,
    })
  end
}
