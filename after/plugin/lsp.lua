local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
    local bufmap = function(keys, func)
        vim.keymap.set("n", keys, func, { buffer = bufnr })
    end

    bufmap("<leader>r", vim.lsp.buf.rename)
    bufmap("<leader>a", vim.lsp.buf.code_action)

    bufmap("gd", vim.lsp.buf.definition)
    bufmap("gD", vim.lsp.buf.declaration)
    bufmap("gI", vim.lsp.buf.implementation)
    bufmap("T", vim.lsp.buf.type_definition)
    bufmap("K", vim.lsp.buf.hover)

    bufmap("gr", require("telescope.builtin").lsp_references)
    bufmap("<leader>s", require("telescope.builtin").lsp_document_symbols)
    bufmap("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols)

    bufmap("<leader>dl", ":Telescope diagnostics bufnr=0<CR>")
    bufmap("<leader>d", vim.diagnostic.open_float)
    bufmap("<leader>dn", vim.diagnostic.goto_next)
    bufmap("<leader>dp", vim.diagnostic.goto_prev)
end)

lsp_zero.setup()

require("mason").setup({})
require("mason-lspconfig").setup({

    ensure_installed = {
        "lua_ls",
        "tsserver",
        "biome",
        "astro",
        "gopls",
        "pyright",
        "cssls",
        "tailwindcss",
        "rust_analyzer",
    },

    handlers = {
        lsp_zero.default_setup,

        lua_ls = function()
            require("neodev").setup()
            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            })
        end,

        tsserver = function()
            require("lspconfig").tsserver.setup({

                -- organize imports on save
                vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                    callback = function()
                        vim.lsp.buf.execute_command({
                            command = "_typescript.organizeImports",
                            arguments = { vim.fn.expand("%:p") },
                        })
                    end,
                }),
            })
        end,

        tailwindcss = function()
            local on_attach = function(_, bufnr)
                -- show specific tailwind class name colors whenever we attach to tailwind lsp
                require("tailwindcss-colors").buf_attach(bufnr)
            end

            require("lspconfig").tailwindcss.setup({
                on_attach = on_attach,
            })
        end,
    },
})
