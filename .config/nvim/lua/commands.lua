vim.api.nvim_create_autocmd({"InsertLeave", "CursorHold"}, {
  desc = "Update current buffer after leaving insert mode.",
  callback = function()
    if vim.bo.modifiable then
      vim.cmd('silent! update!')
    end
  end
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Turn on spell-check for text files only.",
  pattern = { "text", "org", "markdown" },
  callback = function()
    vim.opt_local.spell = true
  end
})
