local on_attach = function(_, bufnr)

  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  bufmap('<leader>r', vim.lsp.buf.rename)
  bufmap('<leader>a', vim.lsp.buf.code_action)

  bufmap('gd', vim.lsp.buf.definition)
  bufmap('gD', vim.lsp.buf.declaration)
  bufmap('gI', vim.lsp.buf.implementation)
  bufmap('<leader>D', vim.lsp.buf.type_definition)

  bufmap('gr', require('telescope.builtin').lsp_references)
  bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
  bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

  bufmap('K', vim.lsp.buf.hover)

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("mason").setup()
require("mason-lspconfig").setup_handlers({

    function(server_name)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,

    ["lua_ls"] = function()
        require('neodev').setup()
        require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            }
        }
    end,

    ['astro'] = function()
        require('lspconfig').astro.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,


    ['pyright'] = function()
        require('lspconfig').pyright.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,

    ['gopls'] = function()
        require('lspconfig').gopls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end, 

    ['eslint'] = function()
        require('lspconfig').eslint.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,

    ['tailwindcss'] = function()
        require('lspconfig').tailwindcss.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,

    ['yamlls'] = function()
        require('lspconfig').yamlls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,

})








