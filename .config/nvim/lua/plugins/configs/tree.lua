return function()
  local util = require('util')

  vim.g.loaded_tree=nil
  vim.g.nvim_tree_auto_close = true
  vim.g.nvim_tree_width = 45
  vim.g.nvim_tree_auto_ignore_ft = {'startify'}

  util.nnoremap({ 'silent' }, '<A-²>', ':NvimTreeToggle<CR>')
  util.nnoremap({ 'silent' }, '<leader>²', ':NvimTreeFindFile<CR>')
end
