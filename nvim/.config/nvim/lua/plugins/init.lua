return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
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
        "markdown", "fish", "bash", "html", "css", "java", "ocaml"
      },
    },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        python = { "ruff_format" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        java = { "google-java-format" },
        ocaml = { "ocamlformat" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
          command = 'codelldb',
          args = { "--port", "${port}" },
        }
      }
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      dap.adapters.java = function(callback)
        callback({
          type = 'server',
          host = '127.0.0.1',
          port = 5005,
        })
      end
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    },
  },

  {
    "Civitasv/cmake-tools.nvim",
    ops = {},
    config = function()
      require("cmake-tools").setup({
        cmake_build_directory = "build",
      })
    end,
  },

  {
    "kaarmu/typst.vim",
    ft = "typst",
    init = function()
      vim.g.typst_conceal_math = 0
      vim.g.typst_conceal_emoji = 1
    end
  },
  {
    "pxwg/math-conceal.nvim",
    ft = { "plaintex", "tex", "context", "bibtex", "markdown", "typst" },
    main = "math-conceal",
    opts = { conceal = { "greek", "script", "math", "font", "delim", "phy" }, ft = { "plaintex", "tex", "context", "bibtex", "markdown", "typst" } },
    config = function(
        _, opts)
      local math_conceal = require("math-conceal")
      local function reveal_cursor_line() vim.opt_local.concealcursor = "" end
      math_conceal.setup(opts)
      math_conceal.set()
      reveal_cursor_line()
      vim.schedule(reveal_cursor_line)
      vim.defer_fn(reveal_cursor_line, 100)
    end
  },
  {
    "windwp/nvim-autopairs",
    opts = { fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } },
    config = function(
        _, opts)
      local npairs = require("nvim-autopairs")
      npairs.setup(opts)
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")
      npairs.add_rule(Rule("$", "$", "typst"):with_pair(cond.not_after_regex("%$")))
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    build = function()
      require("typst-preview").update()
    end,
    opts = {}
  },
  { "ajbucci/ipynb.nvim", ft = "ipynb", dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" }, opts = {} },
}
