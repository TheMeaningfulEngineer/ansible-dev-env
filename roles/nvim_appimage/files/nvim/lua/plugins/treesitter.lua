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
      ensure_installed = { "lua", "python", "markdown", "markdown_inline", "bash", "comment", "dockerfile", "json", "bitbake"},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    }
  end
}
