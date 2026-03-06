return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                ST1000 = false,
              },
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        golangcilint = function()
          local linter = vim.deepcopy(require("lint.linters.golangcilint"))
          local file = vim.api.nvim_buf_get_name(0)
          local dir = file ~= "" and vim.fs.dirname(file) or vim.fn.getcwd()
          local root_marker = vim.fs.find({ "go.work", "go.mod" }, { path = dir, upward = true })[1]
          local mod_root = root_marker and vim.fs.dirname(root_marker) or vim.fn.getcwd()

          linter.cwd = mod_root
          linter.append_fname = false
          linter.args = {
            "run",
            "--output.json.path=stdout",
            "--output.text.path=",
            "--output.tab.path=",
            "--output.html.path=",
            "--output.checkstyle.path=",
            "--output.code-climate.path=",
            "--output.junit-xml.path=",
            "--output.teamcity.path=",
            "--output.sarif.path=",
            "--issues-exit-code=0",
            "--show-stats=false",
            function()
              return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
            end,
          }

          return linter
        end,
      },
    },
  },
}
