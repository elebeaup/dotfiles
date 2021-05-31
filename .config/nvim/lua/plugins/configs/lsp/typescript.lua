local lspconfig = require('lspconfig')
local util = require('util')


local M = {}

--[[local ts_utils = require('nvim-lsp-ts-utils')

local ts_utils_settings = {
    eslint_bin = "eslint",
    eslint_enable_diagnostics = true,
}]]

M.setup = function(on_attach)
    lspconfig.typescript.setup({
        on_attach = function(client, bufnr)
            --client.resolved_capabilities.document_formatting = false
            on_attach(client, bufnr)

            --ts_utils.setup(ts_utils_settings)
            --ts_utils.setup_client(client)

            --[[u.buf_map("n", "gs", ":TSLspOrganize<CR>", nil, bufnr)
            u.buf_map("n", "gI", ":TSLspRenameFile<CR>", nil, bufnr)
            u.buf_map("n", "gt", ":TSLspImportAll<CR>", nil, bufnr)
            u.buf_map("n", "qq", ":TSLspFixCurrent<CR>", nil, bufnr)]]
        end
    })
end

return M
