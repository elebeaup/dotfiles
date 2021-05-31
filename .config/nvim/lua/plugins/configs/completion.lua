return function()
  vim.cmd[[
    packadd vim-vsnip nvim-autopairs
  ]]

  local util = require('util')
  local compe = require('compe')
  local npairs = require('nvim-autopairs')
  local t = util.t
  local inoremap = util.inoremap
  local imap = util.imap
  local smap = util.smap

  -- Completion + Autopairs
  -- Only autocomplete when I have a language server running
  compe.setup({
    enabled = true,
    preselect = 'always',
    source = {
      -- Passing a dict enables the completion source
      -- Menu is sorted by priority highest -> lowest
      vsnip           = {priority = 100},
      nvim_lsp        = {priority = 90},
      nvim_treesitter = {priority = 86},
      nvim_lua        = {priority = 85},
      buffer          = {priority = 80},
      path            = {priority = 70},
    },
  })

  vim.g.completion_confirm_key = ""

  _G.utils.completion_confirm=function()
    if vim.fn.pumvisible() ~= 0  then
      if vim.fn.complete_info()['selected'] ~= -1 then
        return vim.fn['compe#confirm'](npairs.esc('<CR>'))
      else
        return npairs.esc('<CR>')
      end
    else
      return npairs.autopairs_cr()
    end
  end

  inoremap({ 'silent', 'expr' }, '<C-Space>', 'compe#complete()')
  inoremap({ 'silent', 'expr' }, '<CR>', 'v:lua.utils.completion_confirm()')

  -- Snippets
  -- Expand
  imap({ 'silent', 'expr' }, '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"')
  smap({ 'silent', 'expr' }, '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"')

  -- Expand or jump
  imap({ 'silent', 'expr' }, '<C-l>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"')
  smap({ 'silent', 'expr' }, '<C-l>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"')

  -- Jump forward or backward
  imap({ 'silent', 'expr' }, '<Tab>', 'pumvisible() == 1 ? "<CR>" : vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<Tab>"')
  smap({ 'silent', 'expr' }, '<Tab>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"')
  imap({ 'silent', 'expr' }, '<S-Tab>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"')
  smap({ 'silent', 'expr' }, '<S-Tab>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"')
end
