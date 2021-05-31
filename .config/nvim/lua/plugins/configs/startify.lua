return function()
  vim.g.startify_session_persistence = 1
  vim.g.startify_session_before_save = { 'silent! tabdo NvimTreeClose' }
end
