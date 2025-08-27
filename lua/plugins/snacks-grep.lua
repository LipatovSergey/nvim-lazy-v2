-- lua/plugins/snacks-grep.lua
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts = opts or {}
    opts.picker = opts.picker or {}
    opts.picker.grep = vim.tbl_deep_extend("force", opts.picker.grep or {}, {
      -- Явно укажем ripgrep
      cmd = "rg",
      -- КЛЮЧЕВОЕ: никаких --no-ignore и --no-ignore-vcs!
      -- Добавим только то, что нужно:
      args = {
        "--hidden",       -- искать и в скрытых (но с учётом ignore-файлов)
        "--smart-case",
        "--glob", "!**/node_modules/**",  -- исключить node_modules
      },
    })
    return opts
  end,
}

