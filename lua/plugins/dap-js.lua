return {
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mason-org/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local mason_path = vim.fn.stdpath("data") .. "/mason"

      require("dap-vscode-js").setup({
        node_path = vim.fn.exepath("node"),
        debugger_path = mason_path .. "/packages/js-debug-adapter",
        debugger_cmd = { mason_path .. "/bin/js-debug-adapter" },
        log_file_path = vim.fn.stdpath("cache") .. "/dap_vscode_js.log",
        log_file_level = vim.log.levels.ERROR,
        log_console_level = vim.log.levels.ERROR,
        adapters = {
          "pwa-node",
          "node-terminal",
          "pwa-chrome",
          "pwa-msedge",
          "pwa-extensionHost",
        },
      })

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "127.0.0.1",
        port = "${port}",
        executable = {
          command = mason_path .. "/bin/js-debug-adapter",
          args = { "${port}" },
        },
      }

      for _, language in ipairs({ "javascript", "typescript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch current file",
            runtimeExecutable = "tsx",
            program = "${file}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            sourceMaps = true,
            skipFiles = {
              "<node_internals>/**",
              "**/node_modules/**",
            },
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            skipFiles = {
              "<node_internals>/**",
              "**/node_modules/**",
            },
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach by port 9229",
            address = "127.0.0.1",
            port = 9229,
            cwd = "${workspaceFolder}",
            skipFiles = {
              "<node_internals>/**",
              "**/node_modules/**",
            },
          },
        }
      end

      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>du", function()
        require("dapui").toggle()
      end, { desc = "Debug: Toggle UI" })
    end,
  },
}
