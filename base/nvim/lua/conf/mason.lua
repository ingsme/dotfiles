require('mason').setup()
require('mason-lspconfig').setup({
        ensure_installed = { 'bashls', 'puppet', 'sumneko_lua', 'ruby_ls', 'yamlls' },
    })
require('mason-lspconfig').setup_handlers({
        function (server_name)
            require('lspconfig')[server_name].setup {}
        end,

        ['sumneko_lua'] = function ()
            require('lspconfig').sumneko_lua.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
        end,

        ['puppet'] = function ()
            require('lspconfig').puppet.setup {
                settings = {
                    puppet = {
                        editorService = {
                            formatOnType = {
                                enable = true,
                            }
                        }
                    }
                }
            }
        end,

        ['yamlls'] = function ()
            require('lspconfig').yamlls.setup {
                settings = {
                    yaml = {
                        format = {
                            enable = true,
                            singleQuote = true,
                        }
                    }
                }
            }
        end,
    })
