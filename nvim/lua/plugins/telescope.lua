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
    function live_grep(dir)
      local args = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--no-ignore-vcs",
      }
    
      local target_dir = dir or vim.loop.cwd()
    
      require("telescope.builtin").live_grep({
        vimgrep_arguments = args,
        cwd = target_dir,
        search_dirs = { target_dir },  -- limits grep to file content in the directory
      })
    end

    
    -- Function to find files with custom rg command and ivy theme
    --
    function find_files(dir)
      local cmd = { "rg", "--files", "--no-ignore-vcs" }
      require("telescope.builtin").find_files({
        find_command = cmd,
        cwd = dir or vim.loop.cwd(),
      })
    end

    -- Key mappings
    vim.keymap.set({'n', 'v'}, '<Leader>f', find_files)
    vim.keymap.set({'n','v'} , '<Leader>r', live_grep)
    vim.keymap.set('n', '<C-p>', ':Telescope buffers theme=ivy <CR>')
    vim.keymap.set('n', '<C-n>', ':Telescope buffers theme=ivy <CR>')
    vim.keymap.set('n', '<Leader>m', telescope.marks)
    vim.keymap.set('n', '<Leader>g', telescope.commands)

    local function if_dir_exists(dir, fn)
      return function()
        if vim.fn.isdirectory(vim.fn.expand(dir)) == 1 then
          fn(dir)
        else
          vim.notify("Directory " .. dir .. " not found", vim.log.levels.WARN)
        end
      end
    end

    vim.keymap.set('n', '<leader>df', if_dir_exists('/home/alan-nt/workspace/all-docs/raw-content', find_files),
      { desc = "Find files in all-docs" })
    vim.keymap.set('n', '<leader>dr', if_dir_exists('/home/alan-nt/workspace/all-docs/raw-content', live_grep),
      { desc = "Grep in all-docs" })
  end
}


