-- Automatically reload a file on external changes
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  desc = "Reload file when gaining focus",
  group = vim.api.nvim_create_augroup("reload-focus-retrieved", { clear = true }),
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

