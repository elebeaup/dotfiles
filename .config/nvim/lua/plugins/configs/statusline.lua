return function()
  vim.cmd('packadd lsp-status.nvim')

  local lsp_status = require'lsp-status'.status
  local util = require'util'

  util.unload_lua_namespace('lualine')


  require('lualine').setup {
    options = {
      theme = 'tokyonight',
    },
    sections = {
      lualine_c = {
        {'filename', file_status = true, full_path = true},
        lsp_status
      }
    }
  }
end
