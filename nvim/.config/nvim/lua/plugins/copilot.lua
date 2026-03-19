return {
  {
    "github/copilot.vim",
    cmd = { "Copilot", "CopilotEnable", "CopilotDisable" },
    event = "InsertEnter", -- load only when editing
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

      -- Optional: keymap to toggle easily
      vim.keymap.set("n", "<leader>cp", ":CopilotToggle<CR>", { silent = true, desc = "Toggle Copilot" })
    end,
  },
}
