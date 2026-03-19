return {
  {
    "github/copilot.vim",
    cmd = { "Copilot", "CopilotEnable", "CopilotDisable" },
    event = "InsertEnter", -- load only when editing
    keys = {
      { "<leader>at", "<cmd>CopilotToggle<CR>", desc = "Toggle Copilot" },
      { "<leader>ae", "<cmd>Copilot enable<CR>", desc = "Enable Copilot" },
      { "<leader>ad", "<cmd>Copilot disable<CR>", desc = "Disable Copilot" },
      { "<leader>aa", "<cmd>Copilot auth<CR>", desc = "Authenticate Copilot" },
      { "<leader>as", "<cmd>Copilot status<CR>", desc = "Copilot status" },
    },
    config = function()
      -- disable by default
      vim.g.copilot_enabled = 0

      -- Custom toggle command
      vim.api.nvim_create_user_command("CopilotToggle", function()
        if vim.g.copilot_enabled == 1 then
          vim.cmd("Copilot disable")
          vim.g.copilot_enabled = 0
          print("🛑 Copilot disabled")
        else
          vim.cmd("Copilot enable")
          vim.g.copilot_enabled = 1
          print("✅ Copilot enabled")
        end
      end, {})
    end,
  }
}
