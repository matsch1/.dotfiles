return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true,
    opts = {
      groups = {
        github_dark_default = {
          CopilotSuggestion = { fg = "#8b9eb2", style = "italic" },
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "github_dark_default" },
  },
}
