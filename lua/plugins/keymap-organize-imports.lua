return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- Горячая клавиша: <leader>oi
      vim.keymap.set("n", "<leader>oi", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports" },
            diagnostics = {},
          },
        })
      end, { desc = "Organize Imports (LSP)" })
    end,
  },
}
