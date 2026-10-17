--- This is not dircetly from plugins/lspconfig.lua
--- It's lazy that actually provides this module
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    vim.notify("[ERROR] Failed to load lspconfig!", vim.log.levels.ERROR)
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = {
  "basedpyright",
  "bashls",
  "lua_ls",
}

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Find references" })
vim.keymap.set("n", "gn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show LSP diagnostics in a floating window" })

-- Load each LSP config and call setup.
for _, server in ipairs(servers) do
  local ok, module = pcall(require, "lsp." .. server)
  if not ok then
    vim.notify("[ERROR] Failed to load LSP module: " .. server, vim.log.levels.ERROR)
  elseif type(module.config) ~= "function" then
    vim.notify("[ERROR] LSP module " .. server .. " does not have a config() function!", vim.log.levels.ERROR)
  else
    vim.lsp.config(server, module.config(capabilities))
    local command = vim.lsp.config[server].cmd
    if type(command) == "table" and vim.fn.executable(command[1]) == 1 then
      vim.lsp.enable(server)
    end
  end
end


vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
  pattern = "*",
})
