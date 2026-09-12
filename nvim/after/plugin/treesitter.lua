require('nvim-treesitter').setup {
    -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
    install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'rust', 'javascript', 'typescript', 'python', 'lua', 'tsx' }

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'rust', 'javascript', 'typescript', 'python', 'lua', 'tsx' },
    callback = function()
        vim.treesitter.start()                                    -- highlighting
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'     -- folds
        vim.wo.foldmethod = 'expr'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation

        vim.wo.foldlevel = 99

    end,
})
