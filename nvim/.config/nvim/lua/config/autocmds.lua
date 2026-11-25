-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = vim.api.nvim_create_augroup("autoreload_external_changes", { clear = true }),
  desc = "Check for external file changes",
  callback = function()
    if vim.fn.mode() == "n" and vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("filetype_fallback", { clear = true }),
  desc = "Retry filetype detection if it was skipped when opening a file",
  nested = true,
  callback = function(ev)
    local buf = vim.bo[ev.buf]
    if not vim.g.did_load_filetypes or ev.file == "" or buf.buftype ~= "" or buf.filetype ~= "" then
      return
    end

    -- Picker opens can skip :setfiletype when did_filetype() is already true.
    local ft, on_detect = vim.filetype.match({ buf = ev.buf })
    if ft then
      if on_detect then
        on_detect(ev.buf)
      end
      buf.filetype = ft
    end
  end,
})
