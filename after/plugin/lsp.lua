local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(_, bufnr)

    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end

    bufmap('<leader>r', vim.lsp.buf.rename)
    bufmap('<leader>a', vim.lsp.buf.code_action)

    bufmap('gd', vim.lsp.buf.definition)
    bufmap('gD', vim.lsp.buf.declaration)
    bufmap('gI', vim.lsp.buf.implementation)
    bufmap('T', vim.lsp.buf.type_definition)
    bufmap('K', vim.lsp.buf.hover)

    bufmap('gr', require('telescope.builtin').lsp_references)
    bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
    bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

    bufmap('<leader>dl', ':Telescope diagnostics bufnr=0<CR>')
    bufmap('<leader>d', vim.diagnostic.open_float)
    bufmap('<leader>dn', vim.diagnostic.goto_next)
    bufmap('<leader>dp', vim.diagnostic.goto_prev)

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {})
end

-- mason setup --
local default_setup = function(server)
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

require("mason").setup()
require('mason-lspconfig').setup({

    ensure_installed = {
        'lua_ls',
        'tsserver',
        'astro',
        'gopls',
        'pyright',
        'cssls',
        'tailwindcss',
    },

    handlers = {
        default_setup,

        lua_ls = function()
            require('neodev').setup()
            require('lspconfig').lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                }
            }
        end,
    }
})
