return {
  config = function(capabilities)
    return {
      capabilities = capabilities,
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
            rules = {
              reportUnusedCallResult = "none",
            },
          },
        },
      },
    }
  end,
}
