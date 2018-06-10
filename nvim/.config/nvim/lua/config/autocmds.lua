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

