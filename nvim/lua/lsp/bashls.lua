return {
  config = function(capabilities)
    return {
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
    }
  end,
}
