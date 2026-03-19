-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.textwidth = 0
vim.opt.swapfile = false
vim.opt.number = true -- Print the line number in front of each line
vim.opt.relativenumber = false -- Show the line number relative to the line with the cursor in front of each line.
vim.opt.syntax = "on" -- When this option is set, the syntax with this name is loaded.
vim.opt.autoindent = true -- Copy indent from current line when starting a new line.
vim.opt.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
vim.opt.encoding = "UTF-8" -- Sets the character encoding used inside Vim.
vim.opt.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
vim.opt.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes
vim.opt.title = true -- When on, the title of the window will be set to the value of 'titlestring'
vim.opt.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
vim.opt.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
vim.opt.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
vim.opt.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
vim.opt.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
vim.opt.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
vim.opt.splitright = true
vim.opt.splitbelow = true -- When on, splitting a window will put the new window below the current one
vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.background = "light"
vim.g.lazyvim_picker = "telescope"
