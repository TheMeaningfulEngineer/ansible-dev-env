vim.cmd [[colorscheme onedark]]


require('nvim-treesitter.configs').setup {
  -- one of "all", "maintained" (parsers with maintainers),
  -- or a list of languages
  ensure_installed = { "lua", "python", "markdown", "bash", "comment" },
  playground = {
    enable = true,
  },
    highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }

}

