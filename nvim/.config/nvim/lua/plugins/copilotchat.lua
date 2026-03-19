return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "gpt-4.1", -- AI model to use
      temperature = 0.1, -- Lower = focused, higher = creative
      window = {
        layout = "vertical",
        width = 0.3,
      },
      auto_insert_mode = true,
    },
    config = function()
      -- Register which-key group for Agent menu (new API)
      local wk = require("which-key")
      wk.add({
        { "<leader>a", group = "Agent" },
      })

      -- CopilotChat keybindings (Agent menu)
      vim.keymap.set("n", "<leader>ac", ":CopilotChat<CR>", { desc = "Open chat" })
      vim.keymap.set("v", "<leader>ac", ":CopilotChat<CR>", { desc = "Open chat with selection" })
      vim.keymap.set("n", "<leader>aq", ":CopilotChatQuick<CR>", { desc = "Quick chat" })
      vim.keymap.set("v", "<leader>aq", ":CopilotChatQuick<CR>", { desc = "Quick chat with selection" })
      vim.keymap.set("n", "<leader>af", ":CopilotChatFix<CR>", { desc = "Fix code" })
      vim.keymap.set("v", "<leader>af", ":CopilotChatFix<CR>", { desc = "Fix selected code" })
      vim.keymap.set("n", "<leader>ae", ":CopilotChatExplain<CR>", { desc = "Explain code" })
      vim.keymap.set("v", "<leader>ae", ":CopilotChatExplain<CR>", { desc = "Explain selected code" })
      vim.keymap.set("n", "<leader>at", ":CopilotChatTests<CR>", { desc = "Generate tests" })
      vim.keymap.set("v", "<leader>at", ":CopilotChatTests<CR>", { desc = "Generate tests for selection" })
      vim.keymap.set("n", "<leader>ao", ":CopilotChatOptimize<CR>", { desc = "Optimize code" })
      vim.keymap.set("v", "<leader>ao", ":CopilotChatOptimize<CR>", { desc = "Optimize selected code" })
      vim.keymap.set("n", "<leader>ad", ":CopilotChatDocs<CR>", { desc = "Generate docs" })
      vim.keymap.set("v", "<leader>ad", ":CopilotChatDocs<CR>", { desc = "Generate docs for selection" })
      vim.keymap.set("n", "<leader>ar", ":CopilotChatReview<CR>", { desc = "Review code" })
      vim.keymap.set("v", "<leader>ar", ":CopilotChatReview<CR>", { desc = "Review selected code" })
    end,
  },
}
