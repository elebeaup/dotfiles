return function()
  vim.cmd [[packadd nvim-treesitter-textobjects]]

  require'nvim-treesitter.configs'.setup {
    ensure_installed = {'lua', 'javascript', 'typescript'},
    highlight = {
      enable = true
    },
    indent = {
      enable = true
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner"
        }
      }
    }
  }
end
