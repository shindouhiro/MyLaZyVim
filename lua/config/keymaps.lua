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
map("n", "<C-p>", ":Telescope find_files<Cr>")
map("n", "<C-r>", ":Telescope projects<Cr>")
map("n", "<C-b>", ":Telescope buffers<Cr>")
map("n", "<C-f>", ":Telescope live_grep<Cr>")
-- lazygit
map("n", "<C-g>", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })

-- bookmark
map("n", "bmc", ":Telescope vim_bookmarks current_file<cr>")
map("n", "bm", ":Telescope vim_bookmarks all<cr>")

-- Resize with arrows
map("n", "sv", "<C-w>v", { desc = "Go to left window", remap = true })

map("n", "<Up>", ":resize -2<CR>")
map("i", "jk", "<Esc>")
map("v", "jk", "<Esc>")
--split
map("n", "ss", "<C-w>s", { desc = "Go to left window", remap = true })
map("n", "<Down>", ":resize +2<CR>")
map("n", "so", "<C-w>o", { desc = "Go to left window", remap = true })
map("n", "<Right>", ":vertical resize +2<CR>")
map("n", "<Left>", ":vertical resize -2<CR>")

map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

local lazyterm = function()
  Util.float_term(nil, { cwd = Util.get_root() })
end

map("n", "<c-t>", lazyterm, { desc = "Terminal (Root Dir)" })
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- -- Move Lines
-- -- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- -- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- -- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- -- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- -- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- -- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- vim.keymap.del("n", "<A-j>")
-- vim.keymap.del("v", "<A-j>")
-- vim.keymap.del("n", "<A-k>")
-- vim.keymap.del("v", "<A-k>")
