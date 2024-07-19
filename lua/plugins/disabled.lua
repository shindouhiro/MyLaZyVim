return {
  {
    "ggandor/flit.nvim",
    enabled = false,
    keys = function()
      return {}
    end,
    config = function() end,
  },
  {
    "ggandor/leap.nvim",
    enabled = false,
    keys = function()
      return {}
    end,
    config = function() end,
  },
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "echasnovski/mini.surround", enabled = true },
  { "echasnovski/mini.pairs", enabled = false },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      for index, keymap in pairs(keys) do
        -- Remove <c-k> keymap in insert mode because it conflicts with our own
        if keymap[1] == "<c-k>" and keymap.mode == "i" then
          keys[index] = nil
          break
        end
      end
    end,
  },
}
