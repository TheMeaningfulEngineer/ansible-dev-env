vim.opt.rtp:prepend(vim.env.VIMRUNTIME)
vim.cmd("syntax enable")

local bundled_parsers = {}
for _, path in ipairs(vim.api.nvim_get_runtime_file("parser/*", true)) do
  if path:find("/lib/nvim/parser/", 1, true) or vim.startswith(path, vim.env.VIMRUNTIME .. "/parser/") then
    local language = vim.fn.fnamemodify(path, ":t:r")
    vim.treesitter.language.add(language, { path = path })
    bundled_parsers[language] = true
  end
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(event)
    local language = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
    if bundled_parsers[language] then
      vim.treesitter.start(event.buf, language)
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldtext = "getline(v:foldstart)"
      vim.wo.foldlevel = 99
    end
  end,
})
