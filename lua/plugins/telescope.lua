local Util = require("lazyvim.util")
return {
  "nvim-telescope/telescope.nvim",
  commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    -- { "<C-b>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<C-p>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    { "<C-f>", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    { "<C-r>", "<Cmd>Telescope projects<CR>", desc = "Projects" },
    -- { "<C-h>", "<Cmd>Telescope oldfiles<CR>", desc = "Projects" },
  },
  opts = {
    defaults = {
      mappings = {
        --   ["<C-j>"] = actions.move_selection_next,
        -- ["<C-k>"] = actions.move_selection_previous,
        i = {
          ["<c-j>"] = function(...)
            return require("telescope.actions").move_selection_next(...)
          end,
          ["<c-k>"] = function(...)
            return require("telescope.actions").move_selection_previous(...)
          end,
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            Util.telescope("find_files", { no_ignore = true, default_text = line })()
          end,
          ["<a-h>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            Util.telescope("find_files", { hidden = true, default_text = line })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["<c-j>"] = function(...)
            return require("telescope.actions").move_selection_next(...)
          end,
          ["<c-k>"] = function(...)
            return require("telescope.actions").move_selection_previous(...)
          end,
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
}
