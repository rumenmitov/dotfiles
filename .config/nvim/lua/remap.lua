-- General
vim.keymap.set("i", "<C-c>", "<esc>")

-- File explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

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


-- Moving lines
vim.keymap.set("i", "<C-Up>", "<esc>:m-2<enter>i")
vim.keymap.set("i", "<C-Down>", "<esc>:m+<enter>i")
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv")

-- Open file in new buffer
vim.keymap.set("n", "<leader>o", "<esc>:e ")

-- Buffers
vim.keymap.set("n", "<C-p>", ":bp<CR>")
vim.keymap.set("n", "<C-n>", ":bn<CR>")
vim.keymap.set("n", "<C-q>", ":bd!<CR>")
vim.keymap.set("n", "<C-s>", ":up!<CR>")

-- Autocomplete + Snippets
vim.keymap.set({ "i", "s" }, "<Tab>", function()
    local ls = require("luasnip")

    if ls.expandable() then
        vim.schedule(function() ls.expand() end)
        return
    end

    if vim.fn.pumvisible() ~= 0 then
        return "<C-y>"
    elseif vim.snippet.active({ direction = 1 }) then
        return "<esc>:lua vim.snippet.jump(1)<enter>"
    elseif ls.jumpable(1) then
        ls.jump(1)
    else return "<Tab>"
    end
end, { expr = true, silent = true })
