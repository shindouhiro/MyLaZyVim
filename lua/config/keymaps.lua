-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- map("n", "<C-f>", ":Telescope live_grep<Cr>")
-- lazygit
map("n", "<C-g>", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })

-- bookmark
map("n", "bm", ":Telescope vim_bookmarks all<cr>")
map("n", "bmc", ":Telescope vim_bookmarks current_file<cr>")

-- Resize with arrows
map("n", "<Up>", ":resize -2<CR>")
map("n", "<Down>", ":resize +2<CR>")
map("n", "<Left>", ":vertical resize -2<CR>")
map("n", "<Right>", ":vertical resize +2<CR>")

--split
map("n", "sv", "<C-w>v", { desc = "Go to left window", remap = true })
map("n", "ss", "<C-w>s", { desc = "Go to left window", remap = true })
map("n", "so", "<C-w>o", { desc = "Go to left window", remap = true })
