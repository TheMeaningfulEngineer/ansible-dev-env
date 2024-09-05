return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp", -- The completion plugin
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/vaults/work",
      },
    },
    daily_notes = {
      folder = "dailies", -- Specify the subfolder for daily notes
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
      -- Construct the file path using the sanitized title.
      local path = spec.dir / spec.id
      return path:with_suffix(".md")
    end,
  },
}
