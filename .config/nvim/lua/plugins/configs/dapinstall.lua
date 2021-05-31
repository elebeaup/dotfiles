return function()
  local dap_install = require('dap-install')
  local dbg_list = require('dap-install.debuggers_list').debuggers

  dap_install.setup({
    verbosely_call_debuggers = true
  })

  dap_install.config('jsnode_dbg', {})
end
