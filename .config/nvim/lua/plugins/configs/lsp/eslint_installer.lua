local lspconfig = require('lspconfig')

--local configs = require 'lspconfig/configs'
--configs['eslintls'] = {
local config = {
  default_config = {
    cmd = { 'node', './vscode-eslint/server/out/eslintServer.js', '--stdio' },
    filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    root_dir = lspconfig.util.root_pattern(".eslintrc*", "package.json", ".git"),
    -- Refer to https://github.com/Microsoft/vscode-eslint#settings-options for documentation.
    settings = {
      validate = "on",
      run = "onType",
      codeAction = {
        disableRuleComment = {
          enable = true,
          -- "sameLine" might not work as expected, see https://github.com/williamboman/nvim-lsp-installer/issues/4
          location = "separateLine"
        },
        showDocumentation = {
          enable = true
        }
      },
      rulesCustomizations = {},
      -- Automatically determine working directory by locating .eslintrc config files.
      --
      -- It's recommended not to change this.
      workingDirectory = {mode = "auto"},
      -- If nodePath is a non-null/undefined value the eslint LSP runs into runtime exceptions.
      --
      -- It's recommended not to change this.
      nodePath = "",
      -- The "workspaceFolder" is a VSCode concept. We set it to the root
      -- directory to not restrict the LPS server when it traverses the
      -- file tree when locating a .eslintrc config file.
      --
      -- It's recommended not to change this.
      workspaceFolder = {
        uri = "/",
        name = "root"
      }
    }
  }
}

--local config = require"lspinstall/util".extract_config("eslintls")

require'lspinstall/servers'.eslint = vim.tbl_extend('force', config, {
  -- lspinstall will automatically create/delete the install directory for every server
  install_script = [[
    rm -rf vscode-eslint
    git clone --depth 1 https://github.com/microsoft/vscode-eslint vscode-eslint
    cd vscode-eslint
    npm install
    npm run compile:server
  ]],
  uninstall_script = nil -- can be omitted
})
