return {
  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    config = function()
      require("goto-preview").setup({
        width = 90,
        height = 12,
        border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
        default_mappings = false,
        debug = false,

        focus_on_open = false,
        dismiss_on_move = false,
        stack_floating_preview_windows = false,

        same_file_float_preview = true,
        force_close = true,
        bufhidden = "wipe",

        preview_window_title = { enable = true, position = "left" },
        zindex = 1,

        references = {
          provider = "telescope",
        },
      })
    end,
    keys = {
      {
        "<leader>pd",
        function()
          require("goto-preview").goto_preview_definition({})
        end,
        desc = "Peek Definition",
      },
      {
        "<leader>pt",
        function()
          require("goto-preview").goto_preview_type_definition({})
        end,
        desc = "Peek Type Definition",
      },
      {
        "<leader>pi",
        function()
          require("goto-preview").goto_preview_implementation({})
        end,
        desc = "Peek Implementation",
      },
      {
        "<leader>pr",
        function()
          require("goto-preview").goto_preview_references({})
        end,
        desc = "Peek References",
      },
      {
        "<leader>pc",
        function()
          require("goto-preview").close_all_win()
        end,
        desc = "Close Preview",
      },
    },
  },
}
