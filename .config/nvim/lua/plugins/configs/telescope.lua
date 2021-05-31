return function()
  local telescope = require('telescope')
  local util = require('util')
  local nnoremap = util.nnoremap

  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
  }

  telescope.load_extension('fzf')

  -- Find files using Telescope command-line sugar.
  nnoremap('<space>ff', '<cmd>Telescope find_files<CR>')
  nnoremap('<space>fg', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
  nnoremap('<space>h', '<cmd>Telescope oldfiles<CR>')
  nnoremap('<space>g', '<cmd>Telescope live_grep<CR>')
  nnoremap('<space>b', '<cmd>Telescope buffers<CR>')
  nnoremap('<space>c', '<cmd>Telescope command_history<CR>')
  nnoremap('<space>s', '<cmd>Telescope search_history<CR>')

  nnoremap('<space>ds', '<cmd>Telescope lsp_document_symbols<CR>')
  nnoremap('<space>ws', '<cmd>Telescope lsp_workspace_symbols<CR>')
end
