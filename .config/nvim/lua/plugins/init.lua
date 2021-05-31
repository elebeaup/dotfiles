local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local util = require('util')
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd 'packadd packer.nvim'                                       -- load the package manager

cmd('autocmd! BufWritePost ' .. fn.stdpath('config') .. '/lua/plugins/*/*.lua,' .. fn.stdpath('config') .. '/lua/plugins/init.lua lua vim.defer_fn(function() vim.cmd("Reload") end, 500)')

require('packer').startup(function(use)
  use {'wbthomason/packer.nvim',opt=true}                       -- Let packer manage itself

  -- Theme
  use {
    'folke/tokyonight.nvim',
    config = require('plugins.configs.colorscheme'),
  }

  use {
    'kyazdani42/nvim-web-devicons',
  }

  use {
    'famiu/nvim-reload',
    config = require('plugins.configs.reload')
  }

  -- Statusline
  use {
    'hoob3rt/lualine.nvim',
    config = require('plugins.configs.statusline'),
    requires = { 'nvim-lua/lsp-status.nvim' },
    opt = true,
    event = { 'BufEnter', 'ColorScheme' },
  }

  -- smooth scrolling
  use {
    'karb94/neoscroll.nvim',
    config = require('plugins.configs.neoscroll'),
    event = { 'BufEnter' }
  }

  -- Interactive scrollbar
  use {
    'dstein64/nvim-scrollview',
    event = { 'BufEnter' }
  }

  -- Fancy start screen
  use {
    'mhinz/vim-startify',
    config = require('plugins.configs.startify'),
  }

  use {
    'windwp/nvim-autopairs',
    config = require('plugins.configs.autopairs'),
    event = 'BufEnter'
  }

  -- Undo tree visualizer
  use {
    'mbbill/undotree',
  }

  -- Delete buffers without closing your windows
  use {
    'ojroques/nvim-bufdel',
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = require('plugins.configs.tree'),
    cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
    keys = { { 'n', '<A-²>' }, { 'n', '<leader>²'} },
  }

  -- Snippets collection
  use {
    'rafamadriz/friendly-snippets',
  }

  -- Completion
  use {
    'hrsh7th/nvim-compe',
    config = require('plugins.configs.completion'),
    requires = { 'windwp/nvim-autopairs', 'hrsh7th/vim-vsnip' },
    opt = true,
    event = 'BufEnter'
  }

  -- Lsp
  use {
    'neovim/nvim-lspconfig',
    config = require('plugins.configs.lsp'),
    requires = {
      'nvim-lua/lsp-status.nvim',
      'kabouzeid/nvim-lspinstall',
      'glepnir/lspsaga.nvim',
      'onsails/lspkind-nvim',
      'ray-x/lsp_signature.nvim',
    },
    opt = true,
    event = 'BufEnter'
  }

  use {
    'folke/trouble.nvim',
    config = require('plugins.configs.trouble'),
    cmd = { 'Trouble', 'TroubleToggle' }
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = require('plugins.configs.treesitter'),
    requires = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    opt = true,
    run = ':TSUpdate',
    event = 'BufEnter'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = require('plugins.configs.telescope'),
    requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', {'nvim-telescope/telescope-fzf-native.nvim', run='make' } }
  }

  -- Debug Adapter Protocol client
  use {
    'mfussenegger/nvim-dap',
    config = require('plugins.configs.dap'),
    event = 'BufEnter'
  }

  use {
    'Pocco81/DAPInstall.nvim',
    config = require('plugins.configs.dapinstall'),
    cmd = { 'DIInstall', 'DIUninstall', 'DIList' }
  }

  -- Terminal in a floating window
  use {
    'voldikss/vim-floaterm',
    config = require('plugins.configs.floaterm'),
  }

  -- Task system
  use {
    'skywind3000/asynctasks.vim',
    requires = { 'skywind3000/asyncrun.vim', 'skywind3000/asyncrun.extra', 'GustavoKatel/telescope-asynctasks.nvim' },
    config = require('plugins.configs.asynctasks')
  }

  use {
    'hashivim/vim-terraform',
    opt = true,
    event = 'BufEnter'
  }

end)
