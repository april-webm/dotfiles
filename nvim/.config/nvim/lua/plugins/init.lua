return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua", "python", "c", "cpp", "rust", "typst",
        "javascript", "typescript", "toml", "yaml", "json",
        "markdown", "fish", "bash", "html", "css",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
        lua = { "stylua" },
        rust = { "rustfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
      },
    },
  },

  {
    "kaarmu/typst.vim",
    ft = "typst",
  },
}
