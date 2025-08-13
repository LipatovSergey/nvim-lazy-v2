-- neotest + адаптер для Jest
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "haydenmeade/neotest-jest",
    },
    opts = function(_, opts)
      opts = opts or {}
      opts.adapters = opts.adapters or {}

      opts.log_level = "debug"
      -- Выбираем команду запуска Jest.
      -- Вариант через npx универсальнее (подтянет локальную версию из node_modules).

      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "node ./node_modules/jest/bin/jest.js --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )

      -- По желанию — компактный вывод в pop-up:
      opts.output = opts.output or {}
      opts.output.open_on_run = true

      return opts
    end,
  },
}
