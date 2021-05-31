return function()
  local util = require('util')
  local tnoremap = util.tnoremap
  local nnoremap = util.nnoremap

  vim.g.floaterm_width=0.95
  vim.g.floaterm_height=0.95

  vim.cmd([[
  augroup floaterm_settings
  autocmd!
  autocmd filetype floaterm nnoremap <buffer> <A-Left> :FloatermPrev<CR><C-\><C-n>
  autocmd filetype floaterm nnoremap <buffer> <A-Right> :FloatermNext<CR><C-\><C-n>
  augroup END
  ]])

  tnoremap({ 'silent' }, '<F12>', [[<C-\><C-n>:FloatermToggle<CR>]])
  nnoremap({ 'silent' }, '<F12>', ':FloatermToggle<CR>')
end
