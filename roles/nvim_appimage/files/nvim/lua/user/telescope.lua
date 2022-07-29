-- Needed to load the native sorter to speed up things.
-- Related to https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- Needs the pluging installed also
--     use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
require('telescope').load_extension('fzf')


custom_grep_command = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--no-ignore-vcs"}

require("telescope").setup {
  defaults = {
    path_display = {"truncate"},
    vimgrep_arguments = custom_grep_command,
    pickers = {
      buffers = {
        show_all_buffers = true,
        sort_lastused = true,
        mappings = {
          i = {["<c-d>"] = "delete_buffer"}
        }
      }
    }
  }
}



-- Return what is in visual selection
function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

-- Start live grep prepopulated with what was visually selected
-- Depends on this: https://github.com/nvim-telescope/telescope.nvim/pull/2092
function live_grep()
    text = vim.getVisualSelection()
    require("telescope.builtin").live_grep({
    	initial_mode = "select",
    	default_text = text})
end


-- Telescope find_files with a custom rg command and ivy theme
function find_files()
    function_name = {"rg", "--files", "--no-ignore-vcs" }
    text = vim.getVisualSelection()
    builtin = require('telescope.builtin')
    builtin.find_files({find_command = function_name,
                        initial_mode = "select",
                        default_text = text})
end

-- Key mappings
vim.keymap.set({'n', 'v'}, '<Leader>f', find_files)
vim.keymap.set({'n','v'} , '<Leader>r', live_grep)
vim.keymap.set('n', '<C-p>', ':Telescope buffers theme=ivy <CR>')
vim.keymap.set('n', '<C-n>', ':Telescope buffers theme=ivy <CR>')
