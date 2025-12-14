return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Obsidian dailies<CR>')
    vim.keymap.set('n', '<Leader>w', ':Obsidian quick_switch<CR>')
    vim.keymap.set('n', '<Leader>t', ':Obsidian tags<CR>')
    vim.keymap.set('n', '<Leader>s', ':Obsidian search<CR>')
    vim.keymap.set('n', 'gf', ':Obsidian follow_link<CR>')


    require("obsidian").setup({
      legacy_commands = false,
      disable_frontmatter = true,
      workspaces = {
        {
          name = "work",
          path = "~/vaults/work",
        },
        {
          name = "personal",
          path = "~/vaults/personal",
        },
      },

      ui = {
        enable = false,
      },

      -- Mirrors Obsidian: newFileFolderPath = "topics"
      notes_subdir = "topics",
      new_notes_location = "notes_subdir",

       -- Mirrors Obsidian Daily Notes: folder = "daily", format = YYYY-MM-DD
      daily_notes = {
          folder = "daily",
          date_format = "%Y-%m-%d",
          template = nil,
      },

      -- Mirrors Obsidian attachments: attachmentFolderPath = "assets"
      attachments = {
        img_folder = "/assets", -- vault-root/assets (per fork docs)

        -- Insert ONLY the filename, not "assets/...".
        image_text_func = function(path)
          local name = vim.fs.basename(tostring(path))
          return string.format("![[%s]]", name)
        end,
      },

      -- Safe kebab-case IDs even when title is nil
      note_id_func = function(title)
        if not title or title == "" then
          return tostring(os.time())
        end
        return title:gsub("%s+", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      end,
      note_path_func = function(spec)
        local path = spec.dir / spec.id
        return path:with_suffix(".md")
      end,
    })
  end,
}
