-- bootstrap lazy.nvim, LazyVim and your plugins
--
require("config.lazy")
vim.cmd.colorscheme("dracula")
require("config.snippet")

-- vim.opt.runtimepath:append("$HOME/Desktop/study/luaPlugin")
-- require("luaPlugin")
-- local pkg = require("luaPlugin")
-- pkg.setup()
