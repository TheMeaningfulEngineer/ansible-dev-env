return {
  "epwalsh/obsidian.nvim",
  version = "*", -- use latest release
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    vim.keymap.set('n', '<Leader>q', ':ObsidianDailies<CR>')
    vim.keymap.set('n', '<Leader>w', ':ObsidianQuickSwitch<CR>')
    vim.keymap.set('n', '<Leader>e', ':ObsidianTags todo<CR>')

    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
      },
      daily_notes = {
        folder = "dailies",
      },
      ui = {
        enable = false,
      },
      wiki_link_func = "use_alias_only",
      note_id_func = function(title)
      -- Convert the title to a valid file name.
      -- This removes any special characters and replaces spaces with dashes.
      local id = title:gsub("%s+", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        return id
      end,
      note_path_func = function(spec)
        local path = spec.dir / spec.id
        return path:with_suffix(".md")
      end,
    })
  end,
}
