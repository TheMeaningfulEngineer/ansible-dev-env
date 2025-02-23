return {
  setup = function(lspconfig, capabilities)
    lspconfig.basedpyright.setup({
      capabilities = capabilities,
      settings = {
        basedpyright = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true
          }
        }
      }
    })
  end
}
