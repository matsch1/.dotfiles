return {
  -- This line finds the snacks.nvim plugin in your installed plugins
  {
    "folke/snacks.nvim",
    -- Override the default options provided by LazyVim
    opts = {
      picker = {
        hidden = true, -- For all pickers
        sources = {
          files = {
            hidden = true, -- For the file source specifically
          },
        },
      },
    },
  },
}
