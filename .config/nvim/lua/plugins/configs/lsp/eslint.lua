local lspconfig = require('lspconfig')
local util = require('util')

local ConfirmExecutionResult = {
  deny = 1,
  confirmationPending = 2,
  confirmationCanceled = 3,
  approved = 4
}

local M = {}
M.setup = function(on_attach)
  lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,

    handlers = {
      ["eslint/openDoc"] = function (_, _, open_doc)
        if util.is_wsl() then
          vim.cmd(string.format('silent !/usr/bin/wslview %q', open_doc.url))
        else
          vim.cmd(string.format('silent open %q', open_doc.url))
        end

        return {id = nil, result = true}
      end,
      ["eslint/confirmESLintExecution"] = function ()
        -- VSCode language servers have a policy to request explicit approval
        -- before applying code changes. We just approve it immediately.
        return ConfirmExecutionResult.approved
      end,
      ["eslint/probeFailed"] = function ()
        vim.api.nvim_err_writeln("ESLint probe failed.")
        return {id = nil, result = true}
      end,
      ["eslint/noLibrary"] = function ()
        vim.api.nvim_err_writeln("Unable to find ESLint library.")
        return {id = nil, result = true}
      end,
      ["eslint/noConfig"] = function ()
        vim.api.nvim_err_writeln("Unable to find ESLint configuration.")
        return {id = nil, result = true}
      end,
    }
  })
end

return M
