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
      ensure_installed = { "lua", "python", "markdown", "markdown_inline", "bash", "comment" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    }


    -- Apply catppuccin colorscheme only for Markdown files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.cmd("colorscheme catppuccin")
      end,
    })
  end
}
