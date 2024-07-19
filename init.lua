-- bootstrap lazy.nvim, LazyVim and your plugins
--
require("config.lazy")
-- vim.cmd.colorscheme("dracula")
vim.cmd.colorscheme("catppuccin")
require("config.snippet")
vim.cmd([[
  command! Scratch lua require("tools").makeScratch()
]])
-- vim.opt.runtimepath:append("$HOME/Desktop/study/luaPlugin")
-- require("luaPlugin")
-- local pkg = require("luaPlugin")
-- pkg.setup()
