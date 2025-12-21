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

-- LSP
vim.keymap.set("n", "grd", vim.lsp.buf.definition)

-- Formatting
vim.keymap.set("n", "grf", vim.lsp.buf.format)

-- Wildmenu (accept completions with Tab)
vim.keymap.set("c", "<Tab>", function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-y>"
  else
    return "<C-z>" -- trigger wildmode
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
