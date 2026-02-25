return {
  {
    "dracula/vim",
    name = "dracula",
    priority = 1000,
    config = function()
      vim.g.dracula_colorterm = 0
      vim.g.dracula_italic = 0
      vim.cmd.colorscheme("dracula")
    end,
  },
}
