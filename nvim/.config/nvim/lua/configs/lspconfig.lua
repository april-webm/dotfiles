require("nvchad.configs.lspconfig").defaults()

local servers = {
  "pyright",
  "clangd",
  "rust_analyzer",
  "tinymist",
  "lua_ls",
  "ts_ls",
}

vim.lsp.enable(servers)
