return function()
  local has_telescope, telescope = pcall(require,'telescope')
  vim.g.asyncrun_open = 6
  vim.g.asynctasks_term_pos = 'floaterm'

  if (has_telescope) then
    -- require('telescope').load_extension('asynctasks')
  end
end
