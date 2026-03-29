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
  init = function()
    vim.g.typst_conceal_math = 1
    vim.g.typst_conceal_emoji = 1
  end,
},
{
  "windwp/nvim-autopairs",
  opts = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  },
  config = function(_, opts)
    local npairs = require("nvim-autopairs")
    npairs.setup(opts)

    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    npairs.add_rule(
      Rule("$", "$", "typst")
        :with_pair(cond.not_after_regex("%$"))
    )

    -- cmp integration
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
},
{
  "chomosuke/typst-preview.nvim",
  ft = "typst",
  build = function() require("typst-preview").update() end,
  opts = {},
},
}
