return {
  config = function(capabilities)
    return {
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      cmd = {
        "clangd",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--limit-results=100",
        "--malloc-trim",
      },
      settings = {
        clangd = {
          fallbackFlags = { "-std=c++17" },
        },
      },
    }
  end,
}
