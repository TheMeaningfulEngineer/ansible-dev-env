require("telescope").setup {
  defaults = {
    path_display = {"truncate"},
    vimgrep_arguments = {"rg", 
                         "--color=never",
                         "--no-heading",
                         "--with-filename",
                         "--line-number",
                         "--column",
                         "--smart-case",
                         "--no-ignore-vcs"}
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
j       }
      }
    }
  }
}

function find_files()
    function_name = {"rg", "--files", "--no-ignore-vcs" }
    themes = require('telescope.themes')
    builtin = require('telescope.builtin')
    builtin.find_files(themes.get_ivy({find_command = function_name}))
end

vim.keymap.set('n', '<Leader>f', find_files)
vim.keymap.set('n', '<Leader>r', ':Telescope live_grep theme=ivy<CR>')
vim.keymap.set('n', '<C-p>', ':Telescope buffers theme=ivy <CR>')
vim.keymap.set('n', '<C-n>', ':Telescope buffers theme=ivy <CR>')
