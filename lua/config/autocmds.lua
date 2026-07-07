-- Группа автокоманд
local group = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- -------------------------------------------------------------------
-- Когда возвращаемся в окно Neovim (alt-tab и т.п.)
-- пересчитываем режим и очищаем буфер нажатий
-- -------------------------------------------------------------------
vim.api.nvim_create_autocmd("FocusGained", {
  group = group,
  callback = function()
    vim.cmd("mode") -- пересчитать режим
    vim.fn.feedkeys("", "x") -- очистить буфер нажатий
  end,
})

-- -------------------------------------------------------------------
-- Markdown: включить spellcheck для EN + RU
-- -------------------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en,ru"
  end,
})

pcall(require, "config.autocmds_local")
