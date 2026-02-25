-- Группа автокоманд
local group = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- ID английской раскладки (English US)
local EN = "1033"

-- Последняя раскладка, использованная в Insert mode
local last_insert_layout = nil

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
-- При выходе из Insert:
-- 1) запоминаем текущую раскладку
-- 2) переключаемся на EN для Normal/Visual/Cmdline
-- -------------------------------------------------------------------
vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  callback = function()
    -- узнать текущую раскладку
    local res = vim.system({ "im-select.exe" }, { text = true }):wait()
    local cur = (res.stdout or ""):gsub("%s+", "")

    if cur ~= "" then
      last_insert_layout = cur
    end

    -- принудительно включаем EN
    vim.system({ "im-select.exe", EN }, { detach = true })
  end,
})

-- -------------------------------------------------------------------
-- При входе в Insert:
-- возвращаем ту раскладку, которая была последней в Insert
-- -------------------------------------------------------------------
vim.api.nvim_create_autocmd("InsertEnter", {
  group = group,
  callback = function()
    if last_insert_layout and last_insert_layout ~= EN then
      vim.system({ "im-select.exe", last_insert_layout }, { detach = true })
    end
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
