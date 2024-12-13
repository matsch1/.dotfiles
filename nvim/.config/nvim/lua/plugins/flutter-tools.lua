return {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require('flutter-tools').setup {
        dev_log = {
          -- toggle it when you run without DAP
          enabled = true,
          open_cmd = "tabedit",
        },
        lsp = {
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        },
      }
    end
  }
