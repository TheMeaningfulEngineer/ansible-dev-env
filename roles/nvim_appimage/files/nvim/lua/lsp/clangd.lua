return {
  setup = function(lspconfig, capabilities)
    lspconfig.clangd.setup({
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      cmd = {
        "clangd",
        "--background-index",          -- Caches results to speed up subsequent queries
        "--pch-storage=memory",        -- Store precompiled headers in memory (faster)
        "--clang-tidy",                -- Enable clang-tidy (remove if not needed)
        "--completion-style=detailed", -- Better autocompletions
        "--header-insertion=iwyu",     -- Insert headers intelligently
        "--limit-results=100",         -- Reduce the number of completion results
        "--malloc-trim"                -- Free memory more aggressively
      },
      settings = {
        clangd = {
          fallbackFlags = { "-std=c++17" },
        },
      },
    })
  end
}
