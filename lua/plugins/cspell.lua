return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = {
          -- на каких типах файлов запускать проверку:
          filetypes = {
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "json",
            "jsonc",
            "markdown",
            "lua",
            "html",
            "css",
          },
          -- можно оставить пустым: LSP сам прочитает ~/.config/cspell/cspell.json
          settings = { cspell = { language = "en" } },
        },
      },
    },
  },
}
