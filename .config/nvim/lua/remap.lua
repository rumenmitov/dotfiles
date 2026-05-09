-- General
vim.keymap.set("i", "<C-c>", "<esc>")
vim.keymap.set({"n", "v"}, "<leader>", ":")

-- Copying and pasting from clipboard
vim.keymap.set("n", "<S-y>", "\"+y")
vim.keymap.set("v", "<S-y>", "\"+y")
vim.keymap.set("n", "<S-p>", "\"+p")
vim.keymap.set("v", "<S-p>", "\"+p")

-- Moving vertically
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Searching for words
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<esc>", function()
  vim.cmd.nohlsearch()
  return "<esc>"
end)

-- Wildmenu 
vim.keymap.set("c", "<Tab>", function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-n>" -- accept completions with Tab
  else
    return "<C-z>" -- trigger wildmode
  end
end, { expr = true, silent = false })

vim.keymap.set("c", "<enter>", function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-y>"  -- select completion
  else
    return "<enter>"
  end
end, { expr = true, silent = false })

-- Autocomplete + Snippets
vim.keymap.set({ "i", "s" }, "<Tab>", function()
    if vim.fn.pumvisible() ~= 0 then
        return "<C-y>"
    elseif vim.snippet.active({ direction = 1 }) then
        return "<esc>:lua vim.snippet.jump(1)<enter>"
    else
        return "<Tab>"
    end
end, { expr = true, silent = true })
