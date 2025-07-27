--- This is not dircetly from plugins/lspconfig.lua
--- It's lazy that actually provides this module
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    vim.notify("[ERROR] Failed to load lspconfig!", vim.log.levels.ERROR)
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Get directory of this script
local lsp_dir = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
local lsp_files = vim.fn.globpath(lsp_dir, "*.lua", false, true)

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Find references" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show LSP diagnostics in a floating window" })

-- Load each LSP config and call setup
for _, file in ipairs(lsp_files) do
  local server = file:match("([^/]+)%.lua$") -- Extract filename without `.lua`
    if server and server ~= "init" then
        local ok, module = pcall(require, "lsp." .. server)
        if not ok then
            vim.notify("[ERROR] Failed to load LSP module: " .. server, vim.log.levels.ERROR)
        elseif type(module.setup) ~= "function" then
            vim.notify("[ERROR] LSP module " .. server .. " does not have a setup() function!", vim.log.levels.ERROR)
        else
            module.setup(lspconfig, capabilities)
        end
    end
end
