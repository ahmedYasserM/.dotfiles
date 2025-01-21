return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    ft = { "python", "go" },
    opts = function()
      require "configs.null-ls"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "json",
        "toml",
        "yaml",
        "cpp",
        "python",
        "go",
        "bash",
        "dockerfile",
        "c",
        "asm",
        "zig",
        "rust"
      },
    },
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = false,
        AARRGGBB = false,
        rgb_fn = true,
        hsl_fn = false,
        css = false,
        css_fn = false,
        mode = "background",
        tailwind = true,
        sass = { enable = false, parsers = { "css" } },
        virtualtext = "■",
        always_update = false,
      },
      buftypes = {},
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    opts = {},
    lazy = false,
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        silent_chdir = false,
        require("nvim-tree").setup {
          view = {
            side = "right",
          },
          sync_root_with_cwd = true,
          respect_buf_cwd = true,
          update_focused_file = {
            enable = true,
            update_root = true,
          },
        },
      }
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "rafamadriz/friendly-snippets",
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },

        progress = {
          enabled = false,
        },

        message = {
          enabled = false,
        },
      },
      messages = {
        enabled = false,
      },
      cmdline = {
        enabled = true,
      },
      notify = {
        enabled = false,
      },
    },

    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },

  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<A-,>",
        function()
          vim.cmd "Trouble diagnostics toggle"
          vim.cmd "wincmd p"
        end,
        desc = "Diagnostics (Trouble)",
      },
    },
  },

  {
    "anurag3301/nvim-platformio.lua",
    cmd = {
      "Pioinit",
      "Piorun",
      "Piocmd",
      "Piolib",
      "Piomon",
      "Piodebug",
      "Piodb",
    },
    dependencies = {
      { "akinsho/nvim-toggleterm.lua" },
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },

  {
    "LunarVim/breadcrumbs.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    'echasnovski/mini.ai',
    version = '*',
    lazy = false,
    config = function()
      require('mini.ai').setup()
    end,
  },

  {
    'echasnovski/mini.surround',
    version = '*',
    lazy = false,
    config = function()
      require('mini.surround').setup()
    end,
  },

  {
    'echasnovski/mini.files',
    version = '*',
    lazy = false,
    config = function()
      require('mini.files').setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
    }
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    -- branch = "develop", -- if you want develop branch
    -- keep in mind, it might break everything
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
    },
    -- (optional) will update plugin's deps on every update
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    ---@type gopher.Config
    opts = {},
  }

}
