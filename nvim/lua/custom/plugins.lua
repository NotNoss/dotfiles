local plugins = {
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
        "bash-language-server"
      }
    }
  }
}
return plugins
