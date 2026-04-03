return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha

      background = {
        light = "latte",
        dark = "macchiato",
      },

      transparent_background = false,

      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },

      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        notify = false,
        mini = false,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
