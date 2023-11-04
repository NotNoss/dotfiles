local plugins = {
  {
    "NotNoss/dev-tunnels.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require('copilot').setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
          }
        }
      })
    end,
  },
  {
   "jackMort/ChatGPT.nvim",
   event = "VeryLazy",
   config = function()
     require("chatgpt").setup({
       api_key_cmd = "pass show chatgpt/api-key"
     })
   end,
   dependencies = {
     "MunifTanjim/nui.nvim",
     "nvim-lua/plenary.nvim",
     "nvim-telescope/telescope.nvim"
   }
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "andweeb/presence.nvim",
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates"})
      return M
    end
  },
  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = {"rust", "toml"},
    config = function()
      local crates = require('crates'),
      crates.setup(opts)
      crates.show()
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("todo-comments").setup {
        signs = true,
        sign_priority = 8
      }
    end
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        stages = 'fade_in_slide_out',
        background_color = 'FloatShadow',
        timeout = 3000
      }

      vim.notify = require('notify')
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup({})
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap"
    },
    ops = {
      handlers = {},
    }
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "codelldb",
        "bash-language-server",
        "rust-analyzer",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "json-lsp",
        "gopls",
      }
    }
  }
}
return plugins
