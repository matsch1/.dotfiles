-- Bootstrap lazy.nvim, LazyVim, and your plugins
require("config.lazy")

-- General settings
require("config.options")

-- Neo-tree setup
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      hide_dotfiles = false, -- Show hidden files (dotfiles)
    },
  },
})

-- Flutter-tools
require("flutter-tools").setup({}) -- use defaults

-- Keybindings

-- Window navigation
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bnext<CR>", { noremap = true, silent = true })

-- Toggle focus between Neo-tree and editor using Ctrl+w
vim.keymap.set("n", "<C-w>", function()
  -- Check if the current window is Neo-tree
  if vim.bo.filetype == "neo-tree" then
    vim.cmd("wincmd l") -- Move focus to the next window
  else
    vim.cmd("Neotree focus") -- Focus Neo-tree
  end
end, { noremap = true, silent = true })
vim.keymap.set("n", "<S-q>", ":bdelete<CR>", { noremap = true, silent = true })

vim.diagnostic.config({
  virtual_text = false, -- Disable inline text (optional)
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    header = "",
    prefix = "",
    wrap = true, -- Enable text wrapping in floating windows
  },
})
