vim.keymap.set('n', '<Leader>f', ':Telescope find_files theme=ivy <CR>', {silent = true})
vim.keymap.set('n', '<Leader>r', ':Telescope live_grep theme=ivy <CR>', {silent = true})
vim.keymap.set('n', '<C-p>', ':Telescope buffers theme=ivy <CR>')
vim.keymap.set('n', '<C-n>', ':Telescope buffers theme=ivy <CR>')

-- local action_state = require "telescope.actions.state"
-- function delete_buffer_custom(prompt_bufnr)
--   local current_picker = action_state.get_current_picker(prompt_bufnr)
-- 
--   function delete_selection_function(selection)
--     if vim.api.nvim_buf_get_option(selection.bufnr, "buftype") == "terminal" then
--       vim.api.nvim_buf_delete(selection.bufnr, { force = true })
--     else
--       vim.api.nvim_buf_delete(selection.bufnr, { force = false })
--     end
--   end
--   current_picker:delete_selection(delete_selection_function)
-- end


require("telescope").setup {
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    }
  }
}
