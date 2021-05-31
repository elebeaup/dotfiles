return function()
  vim.cmd[[
    packadd lspsaga.nvim
    packadd lspkind-nvim
    packadd lsp-status.nvim
    packadd nvim-lspinstall
    packadd lsp_signature.nvim
  ]]
  local util = require('util')
  local saga = require 'lspsaga'
  local lsp_status = require('lsp-status')
  local lspinstall = require('lspinstall')
  local lspconfig = require('lspconfig')

  local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
  local nnoremap = util.nnoremap
  local inoremap = util.inoremap

  -- Add vscode-like pictograms to neovim built-in lsp
  require('lspkind').init()

  -------------------- Saga -------------------------------
  saga.init_lsp_saga({
    use_saga_diagnostic_sign = true,
    -- icons / text used for a diagnostic
    error_sign = "",
    warn_sign  = "",
    hint_sign  = "",
    infor_sign = "",
    code_action_icon = "💡",

    code_action_prompt = {
      enable = true,
      sign = false,
      virtual_text = true
    },

    -- max_hover_width = 80,
    border_style = 'round'
  })

  --------------------- Lsp Status ------------------------------
  lsp_status.config({
    -- kind_labels = vim.g.completion_customize_lsp_label,
    indicator_errors = '',
    indicator_warnings = '',
    indicator_info = '',
    indicator_hint = '',
    indicator_ok = '',
  })

  ---------------------- Lsp config -------------------------------
  local capabilities = vim.tbl_extend('keep', vim.lsp.protocol.make_client_capabilities(), lsp_status.capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = false,
      signs = {
        severity_limit = 'Warning'
      },
      update_in_insert = false
    }
  )

  --vim.fn.sign_define('LspDiagnosticsSignError', {text = '', texthl = 'LspDiagnosticsSignError'})
  --vim.fn.sign_define('LspDiagnosticsSignWarning', {text = '', texthl = 'LspDiagnosticsSignWarning'})
  --vim.fn.sign_define('LspDiagnosticsSignInformation', {text = '', texthl = 'LspDiagnosticsSignInformation'})
  --vim.fn.sign_define('LspDiagnosticsSignHint', {text = '', texthl = 'LspDiagnosticsSignHint'})

  local on_attach = function(client, bufnr)
    -- print("Attached" .. client)
    lsp_status.on_attach(client)
    require('lsp_signature').on_attach()

    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Mappings.
    nnoremap({ 'silent', buffer=bufnr }, '<leader>ca', '<cmd>Lspsaga code_action<CR>')
    nnoremap({ 'silent', buffer=bufnr }, '<leader>cd', '<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>')
    nnoremap({ 'silent', buffer=bufnr }, '<leader>cc', '<cmd>lua require"lspsaga.diagnostic".show_cursor_diagnostics()<CR>')
    nnoremap({ 'silent', buffer=bufnr }, '<A-CR>', '<cmd>Lspsaga code_action<CR>')

    -- Other LSP mapping
    nnoremap({ 'silent', buffer=bufnr }, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    nnoremap({ 'silent', buffer=bufnr }, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    nnoremap({ 'silent', buffer=bufnr }, '<leader>gd', '<cmd>Lspsaga preview_definition<CR>')
    nnoremap({ 'silent', buffer=bufnr }, 'K',  '<cmd>Lspsaga hover_doc<CR>')
    nnoremap({ 'silent', buffer=bufnr }, '<leader>I', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    nnoremap({ 'silent', buffer=bufnr }, 'gs', '<cmd>Lspsaga signature_help<CR>')
    nnoremap({ 'silent', buffer=bufnr }, '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

    nnoremap({ 'silent', buffer=bufnr }, 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>')
    nnoremap({ 'silent', buffer=bufnr }, '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>')

    nnoremap({ 'silent', buffer=bufnr }, '<leader>gh', '<cmd>Lspsaga lsp_finder<CR>')

    nnoremap({ 'silent', buffer=bufnr }, '[d', '<cmd>Lspsaga diagnostic_jump_next<CR>')
    nnoremap({ 'silent', buffer=bufnr }, ']d', '<cmd>Lspsaga diagnostic_jump_prev<CR>')

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
      nnoremap({ 'silent', buffer=bufnr }, '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    elseif client.resolved_capabilities.document_range_formatting then
      nnoremap({ 'silent', buffer=bufnr }, '<leader>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>')
    end

    vim.cmd([[
      augroup lsp
        autocmd!
        "autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()
      augroup END
    ]])

    -- Set autocommands conditional on server_capabilities
    --if client.resolved_capabilities.document_highlight then
    --  vim.api.nvim_exec([[
    --    augroup lsp_document_highlight
    --    "autocmd! * <buffer>
    --    "autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --   psaga hover_doc
    --  psaga hover_doc
    --  "autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --    augroup END
    --  ]], false)
    -- end
  end

  ---------------------- Lsp install -------------------------------
  -- Custom install
  require('plugins.configs.lsp.eslint_installer')

  lspinstall.setup()
  local function setup_servers()
    local servers = lspinstall.installed_servers()

    for _, server in pairs(servers) do
      local server_setup_module = util.prequire('plugins.configs.lsp.' .. server)

      if (server_setup_module) then
        server_setup_module.setup(on_attach)
      else
        lspconfig[server].setup({
          on_attach = on_attach
        })
      end
    end
  end

  setup_servers()

  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
  lspinstall.post_install_hook = function ()
    setup_servers() -- reload installed servers
    cmd("bufdo e")  -- this triggers the FileType autocmd that starts the server
  end

end
