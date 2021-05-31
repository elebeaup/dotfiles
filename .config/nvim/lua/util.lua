local M = {}

function M.unload_lua_namespace(prefix)
  local prefix_with_dot = prefix .. '.'
  for key, _ in pairs(package.loaded) do
    if key == prefix or key:sub(1, #prefix_with_dot) == prefix_with_dot then
      package.loaded[key] = nil
    end
  end
end

local function map(mode, arg2, arg3, arg4)
  local options = {}
  local lhs = arg2
  local rhs = arg3
  local buffer_handle

  if arg4 ~= nil then
    options = arg2
    lhs = arg3
    rhs = arg4
  end

  for key, val in pairs(options) do
    if (type(key) ~= 'string') then
      if (val == 'buffer') then
        buffer_handle = vim.api.nvim_get_current_buf()
      else
        options[val] = true
      end

      options[key] = nil
    else
      if (key == 'buffer') then
        buffer_handle = val
        options[key] = nil
      end
    end
  end

  if (buffer_handle == nil) then
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  else
    vim.api.nvim_buf_set_keymap(buffer_handle, mode, lhs, rhs, options)
  end
end

local function noremap(mode, arg2, arg3, arg4)
  local options = {noremap = true}
  local lhs = arg2
  local rhs = arg3

  if arg4 ~= nil then
    lhs = arg3
    rhs = arg4
    options = vim.tbl_extend('force', options, arg2)
  end

  map(mode, options, lhs, rhs)
end

function M.nnoremap(...)
  noremap('n', ...)
end

function M.imap(...)
  map('i', ...)
end

function M.smap(...)
  map('s', ...)
end

function M.inoremap(...)
  noremap('i', ...)
end

function M.vnoremap(...)
  noremap('v', ...)
end

function M.xnoremap(...)
  noremap('x', ...)
end

function M.tnoremap(...)
  noremap('t', ...)
end

function M.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

function M.prequire(m) 
  local ok, err = pcall(require, m) 
  if not ok then return nil, err end
  return err
end

function M.is_wsl()
  local lines = vim.fn.readfile('/proc/version')
  if string.match(lines[1], 'Microsoft') ~= nil then
    return 1
  end
end

function M.send_client_request(client_name, ...)
  for _, client in pairs(vim.lsp.get_active_clients()) do
    if client.name == client_name then
      client.request(...)
    end
  end
end

return M
