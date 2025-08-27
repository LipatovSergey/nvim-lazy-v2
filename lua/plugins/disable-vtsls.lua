return {
  { "yioneko/nvim-vtsls", enabled = false }, -- сам плагин vtsls

  {
    "neovim/nvim-lspconfig",
    opts = {
      -- запретить конфигурацию сервера (если кто-то пытается настроить)
      setup = {
        vtsls = function()
          return true
        end,
        tsserver = function()
          return true
        end,
      },
      servers = {
        vtsls = false,
        tsserver = false,
      },
    },
  },
}
