-- Trigger completion popup with Ctrl+B
vim.keymap.set({ "i", "s" }, "<C-b>", function()
  local ok, blink = pcall(require, "blink.cmp")
  if ok then
    blink.show()
  else
    vim.api.nvim_input("<C-x><C-o>") -- fallback to LSP omni-completion
  end
end, { desc = "Trigger completion popup" })

-- Move buuffer to left or right
vim.keymap.set("n", "<C-A-h>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<C-A-l>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })

-- ===========================
-- Delete/Change/Paste Logic
-- ===========================

-- Removing without yanking
vim.keymap.set({ "n", "x" }, "d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set({ "n", "x" }, "x", '"_x', { desc = "Delete char without yanking" })
vim.keymap.set({ "n", "x" }, "c", '"_c', { desc = "Change without yanking" })

-- Paste without yanking
vim.keymap.set("x", "p", '"_dP', { desc = "Visual paste without overwriting register" })

-- ===========================
-- Standard vim behavior alt + x/d/c/p
-- ===========================

vim.keymap.set({ "n", "x" }, "<A-d>", "d", { desc = "Delete (yanks)", noremap = true })
vim.keymap.set({ "n", "x" }, "<A-x>", "x", { desc = "Delete char (yanks)", noremap = true })
vim.keymap.set({ "n", "x" }, "<A-c>", "c", { desc = "Change (yanks)", noremap = true })
vim.keymap.set("x", "<A-p>", "p", { desc = "Paste (yanks)", noremap = true })
