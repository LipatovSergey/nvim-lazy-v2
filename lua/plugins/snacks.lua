return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    picker = {
      hidden = true, -- для picker’а: показывать скрытые файлы
      ignored = true, -- игнорировать .gitignore если нужно
      sources = {
        files = {
          hidden = true, -- обязательно включить
        },
      },
    },
  },
}
