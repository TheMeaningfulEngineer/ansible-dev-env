return {
  setup = function(lspconfig, capabilities)
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          workspace = {
            preloadFileSize = 1000,
            ignoreDir = { ".git", "node_modules" }
          }
        }
      }
    })
  end
}
