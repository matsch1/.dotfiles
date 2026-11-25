return {
  -- This line finds the snacks.nvim plugin in your installed plugins
  {
    "folke/snacks.nvim",
    -- Override the default options provided by LazyVim
    opts = {
      dashboard = { enabled = false },
      picker = {
        hidden = true, -- For all pickers
        sources = {
          explorer = {
            finder = function(opts, ctx)
              local find = require("snacks.picker.source.explorer").explorer(opts, ctx)
              return function(cb)
                -- Snacks can start a finder task even if a refresh already aborted it.
                if not ctx.async:aborted() then
                  find(cb)
                end
              end
            end,
          },
          files = {
            hidden = true, -- For the file source specifically
          },
        },
      },
    },
  },
}
