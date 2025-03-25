return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { ".git/", "node_modules/", "venv/" }, -- Ignore unnecessary files
        },
        pickers = {
          find_files = {
            hidden = true, -- Enable searching hidden files
            no_ignore = true, -- Include ignored files
          },
          live_grep = {
            additional_args = function()
              return { "--hidden" }
            end, -- Grep hidden files
          },
        },
      })

      -- Load FZF native for better performance
      require("telescope").load_extension("fzf")
    end,
  },

  -- Optional: Install FZF native for faster searching
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
