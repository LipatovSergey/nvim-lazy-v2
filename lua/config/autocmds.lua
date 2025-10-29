vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    vim.cmd("mode") -- пересчитать режим
    vim.fn.feedkeys("", "x") -- очистить буфер нажатий
  end,
})
