local lspconfig = require('lspconfig')

local filetypes = {
  javascript = 'eslint',
  typescript = 'eslint',
  typescriptreact = 'eslint',
}

local linters = {
  eslint = {
    sourceName = 'eslint',
    command = 'eslint',
    rootPatterns = {'.eslintrc.js', '.eslintrc.json', 'package.json'},
    debounce = 100,
    args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
    parseJson = {
      errorsRoot = '[0].messages',
      line = 'line',
      column = 'column',
      endLine = 'endLine',
      endColumn = 'endColumn',
      message = '${message} [${ruleId}]',
      security = 'severity'
    },
    securities = {[2] = 'error', [1] = 'warning'}
  }
}

local formatters = {
  prettier = {command = 'prettier', args = {'--stdin-filepath', '%filepath'}}
}

local formatFiletypes = {
  typescript = 'prettier',
  typescriptreact = 'prettier'
}

local M = {}
M.setup = function(on_attach)
  lspconfig.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = vim.tbl_keys(filetypes),
    init_options = {
      filetypes = filetypes,
      linters = linters,
      --formatters = formatters,
      --formatFiletypes = formatFiletypes
    }
  }
end

return M
