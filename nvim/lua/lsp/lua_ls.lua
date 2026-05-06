return {
  config = function(capabilities)
    return {
      capabilities = capabilities,
      settings = {
        Lua = {
          workspace = {
            preloadFileSize = 1000,
            ignoreDir = { ".git", "node_modules" },
          },
        },
      },
    }
  end,
}
