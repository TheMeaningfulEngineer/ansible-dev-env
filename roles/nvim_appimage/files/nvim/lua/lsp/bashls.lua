return {
  setup = function(lspconfig, capabilities)
    lspconfig.bashls.setup({
      capabilities = capabilities,
      filetypes = { "sh", "zsh", "bash" },
      settings = {
        bashIde = {
          globPattern = "*@(.sh|.inc|.bash|.command|.zsh)",
          shellcheckPath = "shellcheck",
          shfmtPath = "shfmt",
          enableSourceErrorDiagnostics = true,
        },
      },
    })
  end
}
