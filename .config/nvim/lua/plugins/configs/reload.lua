return function()
  local reload = require('nvim-reload')
  local util = require('util')

  reload.lua_reload_dirs = {
    vim.fn.stdpath('config')
  }

  reload.pre_reload_hook = function()
    vim.cmd('autocmd! BufEnter')
  end

  reload.post_reload_hook = function()
    require('packer').compile()
  end
end
