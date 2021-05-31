" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/emmanuel_lebeaupin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/emmanuel_lebeaupin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/emmanuel_lebeaupin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/emmanuel_lebeaupin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/emmanuel_lebeaupin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    commands = { "DIInstall", "DIUninstall", "DIList" },
    config = { "\27LJ\2\2±\1\0\0\5\0\b\0\0156\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\1\3\0019\2\4\0005\3\5\0B\2\2\0019\2\6\0'\3\a\0004\4\0\0B\2\3\1K\0\1\0\15jsnode_dbg\vconfig\1\0\1\29verbosely_call_debuggers\2\nsetup\14debuggers\31dap-install.debuggers_list\16dap-install\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/DAPInstall.nvim"
  },
  ["asyncrun.extra"] = {
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/asyncrun.extra"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    config = { "\27LJ\2\2å\1\0\0\4\0\b\0\0156\0\0\0006\1\1\0'\2\2\0B\0\3\0036\2\3\0009\2\4\2)\3\6\0=\3\5\0026\2\3\0009\2\4\2'\3\a\0=\3\6\2\15\0\0\0X\2\0ÄK\0\1\0\rfloaterm\24asynctasks_term_pos\18asyncrun_open\6g\bvim\14telescope\frequire\npcall\0" },
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["lsp-status.nvim"] = {
    load_after = {
      ["lualine.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    after = { "lsp-status.nvim" },
    config = { "\27LJ\2\2ª\2\0\0\a\0\17\0\0306\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\3\0'\1\4\0B\0\2\0029\0\5\0006\1\3\0'\2\6\0B\1\2\0029\2\a\1'\3\b\0B\2\2\0016\2\3\0'\3\b\0B\2\2\0029\2\t\0025\3\v\0005\4\n\0=\4\f\0035\4\14\0004\5\3\0005\6\r\0>\6\1\5>\0\2\5=\5\15\4=\4\16\3B\2\2\1K\0\1\0\rsections\14lualine_c\1\0\0\1\2\2\0\rfilename\16file_status\2\14full_path\2\foptions\1\0\0\1\0\1\ntheme\15tokyonight\nsetup\flualine\25unload_lua_namespace\tutil\vstatus\15lsp-status\frequire\28packadd lsp-status.nvim\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/lualine.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\2÷\1\0\0\3\0\t\0\0146\0\0\0009\0\1\0)\1\0\0=\1\2\0004\0\0\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0005\1\a\0005\2\b\0>\2\2\1=\1\6\0K\0\1\0\1\4\0\0#vim.api.nvim_win_get_height(0)\ttrue\0067\1\2\0\0\vscroll\15<PageDown>\1\4\0\0$-vim.api.nvim_win_get_height(0)\ttrue\0067\1\2\0\0\vscroll\r<PageUp>\14scrolloff\14opt_local\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2<\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bufdel"] = {
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/nvim-bufdel"
  },
  ["nvim-compe"] = {
    after = { "vim-vsnip" },
    after_files = { "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\2ÿ\1\0\0\3\1\t\2\0316\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\21Ä6\0\0\0009\0\1\0009\0\3\0B\0\1\0029\0\4\0\b\0\1\0X\0\tÄ6\0\0\0009\0\1\0009\0\5\0-\1\0\0009\1\6\1'\2\a\0B\1\2\0C\0\0\0X\0\bÄ-\0\0\0009\0\6\0'\1\a\0D\0\2\0X\0\3Ä-\0\0\0009\0\b\0D\0\1\0K\0\1\0\2¿\17autopairs_cr\t<CR>\besc\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\0˛ˇˇˇ\31è\n\1\0\v\0009\0^6\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\3\0'\1\4\0B\0\2\0026\1\3\0'\2\5\0B\1\2\0026\2\3\0'\3\6\0B\2\2\0029\3\a\0009\4\b\0009\5\t\0009\6\n\0009\a\v\0015\b\f\0005\t\14\0005\n\r\0=\n\15\t5\n\16\0=\n\17\t5\n\18\0=\n\19\t5\n\20\0=\n\21\t5\n\22\0=\n\23\t5\n\24\0=\n\25\t=\t\26\bB\a\2\0016\a\0\0009\a\27\a'\b\29\0=\b\28\a6\a\30\0009\a\31\a3\b!\0=\b \a\18\a\4\0005\b\"\0'\t#\0'\n$\0B\a\4\1\18\a\4\0005\b%\0'\t&\0'\n'\0B\a\4\1\18\a\5\0005\b(\0'\t)\0'\n*\0B\a\4\1\18\a\6\0005\b+\0'\t)\0'\n*\0B\a\4\1\18\a\5\0005\b,\0'\t-\0'\n.\0B\a\4\1\18\a\6\0005\b/\0'\t-\0'\n.\0B\a\4\1\18\a\5\0005\b0\0'\t1\0'\n2\0B\a\4\1\18\a\6\0005\b3\0'\t1\0'\n4\0B\a\4\1\18\a\5\0005\b5\0'\t6\0'\n7\0B\a\4\1\18\a\6\0005\b8\0'\t6\0'\n7\0B\a\4\0012\0\0ÄK\0\1\0\1\3\0\0\vsilent\texpr?vsnip#jumpable(-1) ? \"<Plug>(vsnip-jump-prev)\" : \"<S-Tab>\"\f<S-Tab>\1\3\0\0\vsilent\texpr<vsnip#jumpable(1) ? \"<Plug>(vsnip-jump-next)\" : \"<Tab>\"\1\3\0\0\vsilent\texpr_pumvisible() == 1 ? \"<CR>\" : vsnip#available(1) ? \"<Plug>(vsnip-expand-or-jump)\" : \"<Tab>\"\n<Tab>\1\3\0\0\vsilent\texpr\1\3\0\0\vsilent\texprBvsnip#available(1) ? \"<Plug>(vsnip-expand-or-jump)\" : \"<C-l>\"\n<C-l>\1\3\0\0\vsilent\texpr\1\3\0\0\vsilent\texpr:vsnip#expandable() ? \"<Plug>(vsnip-expand)\" : \"<C-j>\"\n<C-j>\1\3\0\0\vsilent\texpr%v:lua.utils.completion_confirm()\t<CR>\1\3\0\0\vsilent\texpr\21compe#complete()\14<C-Space>\1\3\0\0\vsilent\texpr\0\23completion_confirm\nutils\a_G\5\27completion_confirm_key\6g\vsource\tpath\1\0\1\rpriority\3F\vbuffer\1\0\1\rpriority\3P\rnvim_lua\1\0\1\rpriority\3U\20nvim_treesitter\1\0\1\rpriority\3V\rnvim_lsp\1\0\1\rpriority\3Z\nvsnip\1\0\0\1\0\1\rpriority\3d\1\0\2\14preselect\valways\fenabled\2\nsetup\tsmap\timap\rinoremap\6t\19nvim-autopairs\ncompe\tutil\frequire,    packadd vim-vsnip nvim-autopairs\n  \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim", "lspkind-nvim", "lspsaga.nvim", "nvim-lspinstall" },
    config = { "\27LJ\2\2ç\14\0\2\6\2@\0á\1-\2\0\0009\2\0\2\18\3\0\0B\2\2\0016\2\1\0'\3\2\0B\2\2\0029\2\0\2B\2\1\0016\2\3\0009\2\4\2'\3\6\0=\3\5\2-\2\1\0005\3\a\0=\1\b\3'\4\t\0'\5\n\0B\2\4\1-\2\1\0005\3\v\0=\1\b\3'\4\f\0'\5\r\0B\2\4\1-\2\1\0005\3\14\0=\1\b\3'\4\15\0'\5\16\0B\2\4\1-\2\1\0005\3\17\0=\1\b\3'\4\18\0'\5\n\0B\2\4\1-\2\1\0005\3\19\0=\1\b\3'\4\20\0'\5\21\0B\2\4\1-\2\1\0005\3\22\0=\1\b\3'\4\23\0'\5\24\0B\2\4\1-\2\1\0005\3\25\0=\1\b\3'\4\26\0'\5\27\0B\2\4\1-\2\1\0005\3\28\0=\1\b\3'\4\29\0'\5\30\0B\2\4\1-\2\1\0005\3\31\0=\1\b\3'\4 \0'\5!\0B\2\4\1-\2\1\0005\3\"\0=\1\b\3'\4#\0'\5$\0B\2\4\1-\2\1\0005\3%\0=\1\b\3'\4&\0'\5'\0B\2\4\1-\2\1\0005\3(\0=\1\b\3'\4)\0'\5*\0B\2\4\1-\2\1\0005\3+\0=\1\b\3'\4,\0'\5*\0B\2\4\1-\2\1\0005\3-\0=\1\b\3'\4.\0'\5/\0B\2\4\1-\2\1\0005\0030\0=\1\b\3'\0041\0'\0052\0B\2\4\1-\2\1\0005\0033\0=\1\b\3'\0044\0'\0055\0B\2\4\0019\0026\0009\0027\2\15\0\2\0X\3\aÄ-\2\1\0005\0038\0=\1\b\3'\0049\0'\5:\0B\2\4\1X\2\nÄ9\0026\0009\2;\2\15\0\2\0X\3\6Ä-\2\1\0005\3<\0=\1\b\3'\0049\0'\5=\0B\2\4\0016\2\3\0009\2>\2'\3?\0B\2\2\1K\0\1\0\2¿\6¿í\1      augroup lsp\n        autocmd!\n        \"autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()\n      augroup END\n    \bcmd0<cmd>lua vim.lsp.buf.range_formatting()<CR>\1\2\0\0\vsilent\30document_range_formatting*<cmd>lua vim.lsp.buf.formatting()<CR>\14<leader>f\1\2\0\0\vsilent\24document_formatting\26resolved_capabilities*<cmd>Lspsaga diagnostic_jump_prev<CR>\a]d\1\2\0\0\vsilent*<cmd>Lspsaga diagnostic_jump_next<CR>\a[d\1\2\0\0\vsilent <cmd>Lspsaga lsp_finder<CR>\15<leader>gh\1\2\0\0\vsilent\t<F2>\1\2\0\0\vsilent&<cmd>lua vim.lsp.buf.rename()<CR>\agr\1\2\0\0\vsilent/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<leader>D\1\2\0\0\vsilent$<cmd>Lspsaga signature_help<CR>\ags\1\2\0\0\vsilent.<cmd>lua vim.lsp.buf.implementation()<CR>\14<leader>I\1\2\0\0\vsilent\31<cmd>Lspsaga hover_doc<CR>\6K\1\2\0\0\vsilent(<cmd>Lspsaga preview_definition<CR>\15<leader>gd\1\2\0\0\vsilent*<cmd>lua vim.lsp.buf.definition()<CR>\agd\1\2\0\0\vsilent+<cmd>lua vim.lsp.buf.declaration()<CR>\agD\1\2\0\0\vsilent\v<A-CR>\1\2\0\0\vsilentG<cmd>lua require\"lspsaga.diagnostic\".show_cursor_diagnostics()<CR>\15<leader>cc\1\2\0\0\vsilentE<cmd>lua require\"lspsaga.diagnostic\".show_line_diagnostics()<CR>\15<leader>cd\1\2\0\0\vsilent!<cmd>Lspsaga code_action<CR>\15<leader>ca\vbuffer\1\2\0\0\vsilent\27v:lua.vim.lsp.omnifunc\romnifunc\14opt_local\bvim\18lsp_signature\frequire\14on_attachÃ\1\0\0\n\4\a\0\29-\0\0\0009\0\0\0B\0\1\0026\1\1\0\18\2\0\0B\1\2\4H\4\19Ä-\6\1\0009\6\2\6'\a\3\0\18\b\5\0&\a\b\aB\6\2\2\15\0\6\0X\a\4Ä9\a\4\6-\b\2\0B\a\2\1X\a\aÄ-\a\3\0008\a\5\a9\a\4\a5\b\5\0-\t\2\0=\t\6\bB\a\2\1F\4\3\3R\4ÎK\0\1\0\3¿\0¿\t¿\4¿\14on_attach\1\0\0\nsetup\25plugins.configs.lsp.\rprequire\npairs\22installed_servers+\0\0\2\2\1\0\6-\0\0\0B\0\1\1-\0\1\0'\1\0\0B\0\2\1K\0\1\0\n¿\5¿\fbufdo eñ\n\1\0\14\0/\0V6\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\3\0'\1\4\0B\0\2\0026\1\3\0'\2\5\0B\1\2\0026\2\3\0'\3\6\0B\2\2\0026\3\3\0'\4\a\0B\3\2\0026\4\3\0'\5\b\0B\4\2\0026\5\0\0009\5\1\0059\6\t\0009\a\n\0006\b\3\0'\t\v\0B\b\2\0029\b\f\bB\b\1\0019\b\r\0015\t\14\0005\n\15\0=\n\16\tB\b\2\0019\b\17\0025\t\18\0B\b\2\0016\b\0\0009\b\19\b'\t\20\0006\n\0\0009\n\21\n9\n\22\n9\n\23\nB\n\1\0029\v\24\2B\b\4\0029\t\25\b9\t\26\t9\t\27\t+\n\2\0=\n\28\t9\t\25\b9\t\26\t9\t\27\t5\n\31\0005\v\30\0=\v \n=\n\29\t6\t\0\0009\t\21\t9\t!\t6\n\0\0009\n\21\n9\n#\n6\v\0\0009\v\21\v9\v$\v9\v%\v5\f&\0005\r'\0=\r(\fB\n\3\2=\n\"\t3\t)\0006\n\3\0'\v*\0B\n\2\0019\n+\3B\n\1\0013\n,\0\18\v\n\0B\v\1\0013\v.\0=\v-\0032\0\0ÄK\0\1\0\0\22post_install_hook\0\nsetup)plugins.configs.lsp.eslint_installer\0\nsigns\1\0\1\19severity_limit\fWarning\1\0\3\14underline\2\17virtual_text\1\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\17capabilities\29make_client_capabilities\rprotocol\blsp\tkeep\15tbl_extend\1\0\5\17indicator_ok\bÔò´\23indicator_warnings\bÔî©\19indicator_info\bÔëâ\21indicator_errors\bÔôô\19indicator_hint\bÔ†µ\vconfig\23code_action_prompt\1\0\3\17virtual_text\2\tsign\1\venable\2\1\0\a\14hint_sign\bÔ†µ\15error_sign\bÔôô\14warn_sign\bÔî©\29use_saga_diagnostic_sign\2\17border_style\nround\15infor_sign\bÔëâ\21code_action_icon\tüí°\18init_lsp_saga\tinit\flspkind\rinoremap\rnnoremap\14lspconfig\15lspinstall\15lsp-status\flspsaga\tutil\frequireê\1    packadd lspsaga.nvim\n    packadd lspkind-nvim\n    packadd lsp-status.nvim\n    packadd nvim-lspinstall\n    packadd lsp_signature.nvim\n  \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-reload"] = {
    config = { "\27LJ\2\0025\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0\22autocmd! BufEnter\bcmd\bvim6\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fcompile\vpacker\frequireª\1\1\0\5\0\f\1\0196\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0024\2\3\0006\3\4\0009\3\5\0039\3\6\3'\4\a\0B\3\2\0?\3\0\0=\2\3\0003\2\t\0=\2\b\0003\2\v\0=\2\n\0K\0\1\0\0\21post_reload_hook\0\20pre_reload_hook\vconfig\fstdpath\afn\bvim\20lua_reload_dirs\tutil\16nvim-reload\frequire\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-scrollview"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/nvim-scrollview"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = { "\27LJ\2\2ƒ\2\0\0\5\0\16\0\0306\0\0\0'\1\1\0B\0\2\0026\1\2\0009\1\3\1+\2\0\0=\2\4\0016\1\2\0009\1\3\1+\2\2\0=\2\5\0016\1\2\0009\1\3\1)\2-\0=\2\6\0016\1\2\0009\1\3\0015\2\b\0=\2\a\0019\1\t\0005\2\n\0'\3\v\0'\4\f\0B\1\4\0019\1\t\0005\2\r\0'\3\14\0'\4\15\0B\1\4\1K\0\1\0\26:NvimTreeFindFile<CR>\15<leader>¬≤\1\2\0\0\vsilent\24:NvimTreeToggle<CR>\v<A-¬≤>\1\2\0\0\vsilent\rnnoremap\1\2\0\0\rstartify\29nvim_tree_auto_ignore_ft\20nvim_tree_width\25nvim_tree_auto_close\16loaded_tree\6g\bvim\tutil\frequire\0" },
    keys = { { "n", "<A-¬≤>" }, { "n", "<leader>¬≤" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { "\27LJ\2\2†\3\0\0\5\0\19\0\0236\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\3\0'\1\4\0B\0\2\0029\0\5\0005\1\a\0005\2\6\0=\2\b\0015\2\t\0=\2\n\0015\2\v\0=\2\f\0015\2\16\0005\3\r\0005\4\14\0=\4\15\3=\3\17\2=\2\18\1B\0\2\1K\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\6\aac\17@class.outer\aaf\20@function.outer\aab\17@block.outer\aif\20@function.inner\aib\17@block.inner\aic\17@class.inner\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\4\0\0\blua\15javascript\15typescript\nsetup\28nvim-treesitter.configs\frequire(packadd nvim-treesitter-textobjects\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-asynctasks.nvim"] = {
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/telescope-asynctasks.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2ç\6\0\0\a\0\29\00096\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0016\3\0\0'\4\1\0B\3\2\0029\3\4\0035\4\b\0005\5\6\0005\6\5\0=\6\a\5=\5\t\4B\3\2\0019\3\n\0'\4\a\0B\3\2\1\18\3\2\0'\4\v\0'\5\f\0B\3\3\1\18\3\2\0'\4\r\0'\5\14\0B\3\3\1\18\3\2\0'\4\15\0'\5\16\0B\3\3\1\18\3\2\0'\4\17\0'\5\18\0B\3\3\1\18\3\2\0'\4\19\0'\5\20\0B\3\3\1\18\3\2\0'\4\21\0'\5\22\0B\3\3\1\18\3\2\0'\4\23\0'\5\24\0B\3\3\1\18\3\2\0'\4\25\0'\5\26\0B\3\3\1\18\3\2\0'\4\27\0'\5\28\0B\3\3\1K\0\1\0-<cmd>Telescope lsp_workspace_symbols<CR>\14<space>ws,<cmd>Telescope lsp_document_symbols<CR>\14<space>ds&<cmd>Telescope search_history<CR>\r<space>s'<cmd>Telescope command_history<CR>\r<space>c\31<cmd>Telescope buffers<CR>\r<space>b!<cmd>Telescope live_grep<CR>\r<space>g <cmd>Telescope oldfiles<CR>\r<space>h1<cmd>Telescope current_buffer_fuzzy_find<CR>\14<space>fg\"<cmd>Telescope find_files<CR>\14<space>ff\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\28override_generic_sorter\1\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\nsetup\rnnoremap\tutil\14telescope\frequire\0" },
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\2:\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0" },
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble", "TroubleToggle" },
    config = { "\27LJ\2\0025\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\2˜\3\0\0\a\0\15\1\0286\0\0\0'\1\1\0B\0\2\0029\1\2\0009\2\3\0006\3\4\0009\3\5\3*\4\0\0=\4\6\0036\3\4\0009\3\5\3*\4\0\0=\4\a\0036\3\4\0009\3\b\3'\4\t\0B\3\2\1\18\3\1\0005\4\n\0'\5\v\0'\6\f\0B\3\4\1\18\3\2\0005\4\r\0'\5\v\0'\6\14\0B\3\4\1K\0\1\0\24:FloatermToggle<CR>\1\2\0\0\vsilent\"<C-\\><C-n>:FloatermToggle<CR>\n<F12>\1\2\0\0\vsilent„\1  augroup floaterm_settings\n  autocmd!\n  autocmd filetype floaterm nnoremap <buffer> <A-Left> :FloatermPrev<CR><C-\\><C-n>\n  autocmd filetype floaterm nnoremap <buffer> <A-Right> :FloatermNext<CR><C-\\><C-n>\n  augroup END\n  \bcmd\20floaterm_height\19floaterm_width\6g\bvim\rnnoremap\rtnoremap\tutil\frequireÕô≥Ê\fÊÃπˇ\3\0" },
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\2ã\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\2\0\0 silent! tabdo NvimTreeClose!startify_session_before_save!startify_session_persistence\6g\bvim\0" },
    loaded = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-terraform"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/vim-terraform"
  },
  ["vim-vsnip"] = {
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/emmanuel_lebeaupin/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-reload
time([[Config for nvim-reload]], true)
try_loadstring("\27LJ\2\0025\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0\22autocmd! BufEnter\bcmd\bvim6\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fcompile\vpacker\frequireª\1\1\0\5\0\f\1\0196\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0024\2\3\0006\3\4\0009\3\5\0039\3\6\3'\4\a\0B\3\2\0?\3\0\0=\2\3\0003\2\t\0=\2\b\0003\2\v\0=\2\n\0K\0\1\0\0\21post_reload_hook\0\20pre_reload_hook\vconfig\fstdpath\afn\bvim\20lua_reload_dirs\tutil\16nvim-reload\frequire\3ÄÄ¿ô\4\0", "config", "nvim-reload")
time([[Config for nvim-reload]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\2˜\3\0\0\a\0\15\1\0286\0\0\0'\1\1\0B\0\2\0029\1\2\0009\2\3\0006\3\4\0009\3\5\3*\4\0\0=\4\6\0036\3\4\0009\3\5\3*\4\0\0=\4\a\0036\3\4\0009\3\b\3'\4\t\0B\3\2\1\18\3\1\0005\4\n\0'\5\v\0'\6\f\0B\3\4\1\18\3\2\0005\4\r\0'\5\v\0'\6\14\0B\3\4\1K\0\1\0\24:FloatermToggle<CR>\1\2\0\0\vsilent\"<C-\\><C-n>:FloatermToggle<CR>\n<F12>\1\2\0\0\vsilent„\1  augroup floaterm_settings\n  autocmd!\n  autocmd filetype floaterm nnoremap <buffer> <A-Left> :FloatermPrev<CR><C-\\><C-n>\n  autocmd filetype floaterm nnoremap <buffer> <A-Right> :FloatermNext<CR><C-\\><C-n>\n  augroup END\n  \bcmd\20floaterm_height\19floaterm_width\6g\bvim\rnnoremap\rtnoremap\tutil\frequireÕô≥Ê\fÊÃπˇ\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\2\2ã\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\2\0\0 silent! tabdo NvimTreeClose!startify_session_before_save!startify_session_persistence\6g\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2ç\6\0\0\a\0\29\00096\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0016\3\0\0'\4\1\0B\3\2\0029\3\4\0035\4\b\0005\5\6\0005\6\5\0=\6\a\5=\5\t\4B\3\2\0019\3\n\0'\4\a\0B\3\2\1\18\3\2\0'\4\v\0'\5\f\0B\3\3\1\18\3\2\0'\4\r\0'\5\14\0B\3\3\1\18\3\2\0'\4\15\0'\5\16\0B\3\3\1\18\3\2\0'\4\17\0'\5\18\0B\3\3\1\18\3\2\0'\4\19\0'\5\20\0B\3\3\1\18\3\2\0'\4\21\0'\5\22\0B\3\3\1\18\3\2\0'\4\23\0'\5\24\0B\3\3\1\18\3\2\0'\4\25\0'\5\26\0B\3\3\1\18\3\2\0'\4\27\0'\5\28\0B\3\3\1K\0\1\0-<cmd>Telescope lsp_workspace_symbols<CR>\14<space>ws,<cmd>Telescope lsp_document_symbols<CR>\14<space>ds&<cmd>Telescope search_history<CR>\r<space>s'<cmd>Telescope command_history<CR>\r<space>c\31<cmd>Telescope buffers<CR>\r<space>b!<cmd>Telescope live_grep<CR>\r<space>g <cmd>Telescope oldfiles<CR>\r<space>h1<cmd>Telescope current_buffer_fuzzy_find<CR>\14<space>fg\"<cmd>Telescope find_files<CR>\14<space>ff\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\28override_generic_sorter\1\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\nsetup\rnnoremap\tutil\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\2:\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: asynctasks.vim
time([[Config for asynctasks.vim]], true)
try_loadstring("\27LJ\2\2å\1\0\0\4\0\b\0\0156\0\0\0006\1\1\0'\2\2\0B\0\3\0036\2\3\0009\2\4\2)\3\6\0=\3\5\0026\2\3\0009\2\4\2'\3\a\0=\3\6\2\15\0\0\0X\2\0ÄK\0\1\0\rfloaterm\24asynctasks_term_pos\18asyncrun_open\6g\bvim\14telescope\frequire\npcall\0", "config", "asynctasks.vim")
time([[Config for asynctasks.vim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file DIUninstall lua require("packer.load")({'DAPInstall.nvim'}, { cmd = "DIUninstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file DIInstall lua require("packer.load")({'DAPInstall.nvim'}, { cmd = "DIInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file DIList lua require("packer.load")({'DAPInstall.nvim'}, { cmd = "DIList", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[nnoremap <silent> <A-¬≤> <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>A-¬≤>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>¬≤ <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>¬≤", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au ColorScheme * ++once lua require("packer.load")({'lualine.nvim'}, { event = "ColorScheme *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'nvim-scrollview', 'nvim-dap', 'nvim-autopairs', 'lualine.nvim', 'neoscroll.nvim', 'nvim-compe', 'nvim-lspconfig', 'vim-terraform', 'nvim-treesitter'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
