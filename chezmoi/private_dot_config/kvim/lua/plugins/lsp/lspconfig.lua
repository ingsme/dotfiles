local function augroup(name)
  return vim.api.nvim_create_augroup('my_group_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup('lsp_cmds'),
  desc = 'LSP actions',
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end
    --  To jump back, press <C-t>.
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    map('gO', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    -- vim.keymap.set({ 'n', 'x' }, '<leader>F', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { desc = 'Format' })

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp_cmds', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = 'lsp_cmds', buffer = event2.buf })
        end,
      })
    end

    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
    --
    -- This may be unwanted, since they displace some of your code
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, '[T]oggle Inlay [H]ints')
    end
  end,
})

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'hrsh7th/cmp-nvim-lsp',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    local nvim_lsp = require('lspconfig')
    local mason_lspconfig = require('mason-lspconfig')

    local protocol = require('vim.lsp.protocol')

    local on_attach = function(client, bufnr)
      -- format on save
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = vim.api.nvim_create_augroup('Format', { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    mason_lspconfig.setup_handlers({
      function(server)
        nvim_lsp[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ['bashls'] = function()
        nvim_lsp['bashls'].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ['lua_ls'] = function()
        nvim_lsp['lua_ls'].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          -- settings = {
          --   Lua = {
          --     diagnostiscs = {
          --       globals = { 'vim' },
          --     },
          --   },
          -- },
        })
      end,
      ['rubocop'] = function()
        nvim_lsp['rubocop'].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ['html'] = function()
        nvim_lsp['html'].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ['jsonls'] = function()
        nvim_lsp['jsonls'].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ['eslint'] = function()
        nvim_lsp['eslint'].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ['pyright'] = function()
        nvim_lsp['pyright'].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
    })
  end,
}
