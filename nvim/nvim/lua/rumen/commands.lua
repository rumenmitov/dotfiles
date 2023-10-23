-- Genereal
  vim.cmd([[ au BufEnter *.txt,*conf*,*.c,*.cpp,*.rs,*.go,*.html,*.css,*.js,*.ts,*.tsx,*.jsx,*.yaml,*.yml,*.toml,*.py call feedkeys("g;zz") ]])

-- Spell checker
  vim.cmd([[ au BufEnter *.txt :set spell ]])

-- Pretty (formatter) 
  vim.api.nvim_create_user_command('Pretty', '!pretty "%"', {})

-- Highlight colors
  vim.cmd([[ au BufEnter *.css :HighlightColorsOn ]])
