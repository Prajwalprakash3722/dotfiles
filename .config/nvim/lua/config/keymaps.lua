-- Add any additional keymaps here
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event

-- making github co-pilot suggestions accept with shift + enter
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-e>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
