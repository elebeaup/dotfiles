local lspconfig = require('lspconfig')
local fn = vim.fn

local settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [fn.expand('$VIMRUNTIME/lua')] = true,
        [fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}

local M = {}
M.setup = function(on_attach)
  lspconfig.lua.setup({
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    settings = settings
  })
end

return M
