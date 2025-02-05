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
-- close current buffer
vim.api.nvim_create_user_command("Q", function()
  local bufs = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())

  if #bufs > 1 then
    vim.cmd("bnext") -- Switch to the next buffer
    vim.cmd("bd #") -- Delete the previous buffer
  else
    print("Cannot close last buffer!")
  end
end, {})

-- Neo-tree keybindings
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { noremap = true, silent = true }) -- Toggle Neo-tree

-- Toggle focus between Neo-tree and editor using Ctrl+w
vim.keymap.set("n", "<C-w>", function()
  -- Check if the current window is Neo-tree
  if vim.bo.filetype == "neo-tree" then
    vim.cmd("wincmd l") -- Move focus to the next window
  else
    vim.cmd("Neotree focus") -- Focus Neo-tree
  end
end, { noremap = true, silent = true })
