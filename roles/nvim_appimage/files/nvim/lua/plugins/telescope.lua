return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    -- Load the fzf extension
    require('telescope').load_extension('fzf')

    -- Custom grep command
    local custom_grep_command = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--no-ignore-vcs"}

    -- Telescope setup
    require("telescope").setup {
      defaults = {
        path_display = {"truncate"},
        vimgrep_arguments = custom_grep_command
      },
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

    -- Function to get visual selection
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

    local telescope = require('telescope.builtin')

    -- Function to start live grep with custom rg
    function live_grep()
      local function_args = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--no-ignore-vcs"}
      local builtin = require('telescope.builtin')
      builtin.live_grep({vimgrep_arguments = function_args})
    end

    -- Function to find files with custom rg command and ivy theme
    function find_files()
      local function_name = {"rg", "--files", "--no-ignore-vcs" }
      local builtin = require('telescope.builtin')
      builtin.find_files({find_command = function_name})
    end

    -- Key mappings
    vim.keymap.set({'n', 'v'}, '<Leader>f', find_files)
    vim.keymap.set({'n','v'} , '<Leader>r', live_grep)
    vim.keymap.set('n', '<C-p>', ':Telescope buffers theme=ivy <CR>')
    vim.keymap.set('n', '<C-n>', ':Telescope buffers theme=ivy <CR>')
    vim.keymap.set('n', '<Leader>m', telescope.marks)
    vim.keymap.set('n', '<Leader>g', telescope.commands)
    vim.keymap.set('n', 'gr', function() telescope.lsp_references({ jump_type = "never" }) end)
    vim.keymap.set('n', 'gd', telescope.lsp_definitions)
  end
}


