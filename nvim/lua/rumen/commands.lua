--- General
  vim.cmd([[ autocmd BufEnter *.html,*.css,*.js,*.ts,*.jsx,*.tsx,*.json,*.lua,*.py,*.md,*config,*.yaml,*.yml,*.ini,*.c,*.cpp,*.rs,*.sh
    call feedkeys('g;za') ]])
