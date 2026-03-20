return {
  "akinsho/flutter-tools.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      debugger = {
        enabled = true,
        run_via_dap = true,
      },
    })
  end,
}
