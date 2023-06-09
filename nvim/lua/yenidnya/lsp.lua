local map = vim.keymap

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'rust_analyzer',
        'tsserver',
    }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local lsp_attach = function(_, bufnr)
    -- Create your keybindings here...
    map.set('n', '<leader>ch', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover' })
    map.set('n', '<leader>ctd', vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'Type def' })
    map.set('n', '<leader>cn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })
    map.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Action' })

    -- format
    map.set('n', '<leader>cf', function()
        vim.lsp.buf.format { async = true }
    end, { buffer = bufnr, desc = 'Format' })

    -- format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
    })
end

local lsp_config = {
    capabilities = lsp_capabilities,
    group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
    on_attach = function(_, bufnr)
        lsp_attach(_, bufnr)
    end
}

require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup(lsp_config)
    end,
    lua_ls = function()
        require('lspconfig').lua_ls.setup(vim.tbl_extend('force', lsp_config, {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        }))
    end,
    tsserver = function()
        require('typescript').setup({
            server = vim.tbl_extend('force', lsp_config, {
                on_attach = function(_, bufnr)
                    lsp_attach(_, bufnr)
                end,
                init_options = {
                    preferences = {
                        importModuleSpecifierPreference = 'project=relative',
                        jsxAttributeCompletionStyle = 'none'
                    }
                }
            })
        })
    end
})
