return function()
  vim.opt_local.scrolloff = 0

  --require('neoscroll').setup({
  --  use_local_scrolloff = true,
  --  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
    --[['<C-y>'], ']<C-e>',]] --'zt', 'zz', 'zb', '<PageUp>', '<PageDown>'}
  --})

  local t = {}
  t['<PageUp>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '7'}}
  t['<PageDown>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '7'}}

  --require('neoscroll.config').set_mappings(t)
end
