vim.keymap.set(
    'n',
    '<leader>es', '<cmd>lua vim.diagnostic.open_float()<CR>',
    { silent= true }
)

vim.keymap.set(
    'n',
    '<leader>ej', '<cmd>lua vim.diagnostic.goto_next()<CR>',
    { silent= true }
)

vim.keymap.set(
    'n',
    '<leader>ek', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
    { silent= true }
)

vim.keymap.set(
    'n',
    '<leader>eo', '<cmd>Telescope diagnostics<CR>',
    { silent= true }
)

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
})
