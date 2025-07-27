return {
  setup = function(lspconfig, capabilities)
    lspconfig.basedpyright.setup({
      capabilities = capabilities,
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
            rules = {
              reportUnusedCallResult = "none"
            }
          }
        }
      }
    })
  end
}

