-- ~/.config/nvim/lua/plugins/diag-filter-80001.lua
-- Фильтрует только ts(80001) ("File is a CommonJS module; it may be converted to an ES module.")
-- и только для javascript / javascriptreact. Для TypeScript не применяется.

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- защита: не навешивать обёртку несколько раз
      if vim.g._diag_filter_80001_installed then
        return opts
      end
      vim.g._diag_filter_80001_installed = true

      local orig = vim.lsp.handlers["textDocument/publishDiagnostics"]

      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, conf)
        -- пытаемся достать URI документа из result или контекста
        local uri = result and result.uri
          or (ctx and ctx.params and ctx.params.textDocument and ctx.params.textDocument.uri)
        if uri then
          local bufnr = vim.uri_to_bufnr(uri)
          local ft = (bufnr and vim.api.nvim_buf_is_loaded(bufnr)) and vim.bo[bufnr].filetype or nil
          local is_js = ft == "javascript" or ft == "javascriptreact"

          if is_js and result and result.diagnostics then
            local filtered = {}
            for _, d in ipairs(result.diagnostics) do
              -- скрываем только код 80001 в JS-файлах
              if d.code ~= 80001 then
                table.insert(filtered, d)
              end
            end
            result.diagnostics = filtered
          end
        end

        return orig(err, result, ctx, conf)
      end

      return opts
    end,
  },
}
