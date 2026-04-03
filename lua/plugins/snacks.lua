return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts = opts or {}

    opts.explorer = vim.tbl_deep_extend("force", opts.explorer or {}, {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    })

    opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
      hidden = true,
      sources = {
        files = {
          hidden = true,
        },
      },
      grep = {
        cmd = "rg",
        args = {
          "--hidden",
          "--smart-case",
        },
      },
    })

    return opts
  end,
}
