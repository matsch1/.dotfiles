return {
  {
    "sudo-tee/opencode.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "MeanderingProgrammer/render-markdown.nvim", opt = true },
    },
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>o", group = "Opencode" },
      })
      require("opencode").setup({
        keymap_prefix = "<leader>o",
        default_global_keymaps = true,
      })
    end,
  },
}
