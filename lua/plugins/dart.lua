return {
  -- Disable dartls from lspconfig (flutter-tools manages it)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = { enabled = false },
      },
    },
  },

  -- Flutter development tools (manages Dart LSP + Flutter-specific features)
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      flutter_path = "/Users/harshithch/Programs/flutter/bin/flutter",
      lsp = {
        color = {
          enabled = true,
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = false,
          renameFilesWithClasses = "prompt",
          enableSnippets = false,
          updateImportsOnRename = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        enabled = true,
      },
      outline = {
        open_cmd = "30vnew",
        auto_open = false,
      },
    },
    keys = {
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Flutter Outline" },
    },
  },
}
