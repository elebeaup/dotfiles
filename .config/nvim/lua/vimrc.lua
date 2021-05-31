local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()

local util = require('util')

if _G.utils == nil then
  _G.utils={}
end

--[[
function utils.config_reload()
  util.unload_lua_namespace('vimrc')
  util.unload_lua_namespace('util')
  require('vimrc')
  utils.plugins_reload()
end
]]

-------------------- OPTIONS -------------------------------

cmd([[
  augroup buffer_settings
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif     " Return to last edit position when opening files 
    autocmd BufRead * setlocal signcolumn=auto:1-9                                                        " When and how to draw the signcolumn
    autocmd BufWinLeave * if &readonly==0 && filereadable(bufname('%')) | silent update | endif           " Autosave
  augroup END
]])

vim.opt.updatetime = 300                                -- The length of time Vim waits after you stop typing before it triggers the plugin
vim.opt.mouse = 'a'                                     -- Enables mouse support.
vim.opt.hidden = true                                   -- Enable modified buffers in background

local indent = 2
vim.opt.expandtab = true                                -- Use spaces instead of tabs
vim.opt.shiftwidth = indent                             -- Number of spaces to use for each step of (auto)indent
vim.opt.tabstop = indent                                -- Number of spaces tabs count for
vim.opt.ignorecase = true                               -- Ignore case
vim.opt.smartcase = true                                -- Ignore case when the pattern contains lowercase letters only

vim.opt.completeopt = 'menuone,noinsert'                -- Completion options
vim.opt.pumheight = 20                                  -- Maximum number of items to show in the popup menu

vim.opt.backup = false                                  -- Turn backup off
vim.opt.undofile = true
-- vim.opt.autowrite = true

vim.opt.clipboard:prepend {'unnamedplus'}               -- System clipboard

vim.opt.listchars = 'tab:>-,trail:~'
vim.opt.list=true
vim.opt.number=true                                     -- Print line number
vim.opt.relativenumber = true                           -- Relative line numbers
vim.opt.cursorline = true                               -- Highlight the screen line of the cursor
vim.opt.wmh = 0                                         -- The minimal height of a window, when it's not the current window
vim.opt.wmw = 0                                         -- The minimal width of a window, when it's not the current window
vim.opt.wrap = false                                    -- Line wrap
vim.opt.splitbelow = true                               -- Put the new window below the current one
vim.opt.splitright = true                               -- Put the new window right of the current one
vim.opt.showtabline = 2                                 -- Always show the tab line
if fn.has("termguicolors") then
  vim.opt.termguicolors = true
end

vim.g.mapleader = "ù"

-------------------- PLUGINS -------------------------------
require('plugins')

-------------------- MAPPINGS ------------------------------
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
local inoremap = util.inoremap
local xnoremap = util.xnoremap
local tnoremap = util.tnoremap

-- Settings
vim.cmd('command! Settings tabnew ' .. fn.stdpath('config') .. '/lua/vimrc.lua | silent lcd %:h')

--vim.cmd 'command! Reload call v:lua.utils.config_reload()'

-- Use CTRL-S for saving, also in Insert mode
nnoremap({ 'silent' }, '<C-S>', ':update<CR>')
inoremap({ 'silent' }, '<C-S>', '<C-O>:update<CR>')

-- navigate back and forth among motions
nnoremap('<C-M-Left>','<C-O>')
nnoremap('<C-M-Right>','<C-I>')
inoremap('<C-M-Left>','<C-O><C-O>')
inoremap('<C-M-Right>','<C-O><C-I>')

-- Buffers navigation
nnoremap({ 'silent', 'expr' }, '<A-Left>',  [[ &filetype != 'TelescopePrompt' ? ':bprev<CR>' : "" ]])
inoremap({ 'silent', 'expr' }, '<A-Left>',  [[ &filetype != 'TelescopePrompt' ? '<C-O>:bprev<CR>' : "" ]])
nnoremap({ 'silent', 'expr' }, '<A-h>',     [[ &filetype != 'TelescopePrompt' ? ':bprev<CR>' : "" ]])
nnoremap({ 'silent', 'expr' }, '<A-Right>', [[ &filetype != 'TelescopePrompt' ? ':bnext<CR>' : "" ]])
inoremap({ 'silent', 'expr' }, '<A-Right>', [[ &filetype != 'TelescopePrompt' ? '<C-O>:bnext<CR>' : "" ]])
nnoremap({ 'silent', 'expr' }, '<A-l>',     [[ &filetype != 'TelescopePrompt' ? ':bnext<CR>' : "" ]])

-- Windows navigation
nnoremap('<C-w>m', '<C-w>_<C-w>|')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-l>', '<C-w>l')

-- Close the current buffer
nnoremap({ 'silent' }, '<leader>bd', ':BufDel<CR>')
nnoremap({ 'silent' }, '<leader>!', ':BufDel!<CR>')

-- Managing buffers
nnoremap({ 'silent' }, '<leader>bn', ':enew<CR>')

-- Managing tabs
nnoremap({ 'silent' }, '<leader>tn', ':tabnew<CR>')
nnoremap({ 'silent' }, '<leader>to', ':tabonly<CR>')
nnoremap({ 'silent' }, '<leader>tc', ':tabclose<CR>')

function utils.get_selected_text()
  local old_reg=vim.fn.getreg('"')
  local old_regtype=vim.fn.getregtype('"')
  vim.cmd('norm gvy')
  --local selected_text='\\V'..vim.fn.substitute(vim.fn.escape(vim.fn.getreg('"'), "/\\"), '\\_s\\+', '\\\\_s\\\\+', 'g')
  local selected_text='\\V'..vim.fn.substitute(vim.fn.escape(vim.fn.getreg('"'), "/\\"), '\\n', '\\\\n', 'g')
  vim.fn.setreg('"', old_reg, old_regtype)
  return selected_text
end

-- Search for visually selected text
-- https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap({ 'silent' }, '*', ":<C-U>/<C-R>=v:lua.utils.get_selected_text()<CR><CR>")
vnoremap({ 'silent' }, '#', ":<C-U>?<C-R>=v:lua.utils.get_selected_text()<CR><CR>")

-- Move line up/down
nnoremap({ 'silent' }, '<C-S-Down>', ':m+<CR>==')
nnoremap({ 'silent' }, '<C-S-Up>', ':m-2<CR>==')
inoremap({ 'silent' }, '<C-S-Down>', '<Esc>:m+<CR>==gi')
inoremap({ 'silent' }, '<C-S-Up>', '<Esc>:m-2<CR>==gi')
vnoremap({ 'silent' }, '<C-S-Down>', ":m '>+1<CR>gv=gv")
vnoremap({ 'silent' }, '<C-S-Up>', ":m '<-2<CR>gv=gv")

nnoremap({ 'silent' }, '<leader><leader>', ':noh<CR>')        -- Clear highlighting
tnoremap({ 'silent' }, '<leader><leader>', [[<C-\><C-n>]])    -- Switch to normal mode (<C-\><C-n> or <C-*><C-n>)

xnoremap({ 'silent' },  'p','p:let @+=@0<CR>:let @"=@0<CR>')  -- Consitent paste (https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text)
nnoremap('gp', '`[v`]')                                       -- Selecting paste text (https://vim.fandom.com/wiki/Selecting_your_pasted_text)
nnoremap({ 'expr' }, 'p', "getregtype() ==# 'V' ? 'gp=`[' : 'p'")
nnoremap('"p', '"0p')
nnoremap('"P', '"0P')

nnoremap('<leader>a', 'ggVG$')                                 -- Select all
inoremap('<C-a>', '<ESC>ggVG$')                                -- Select all
nnoremap('<BS>', 'i<BS>')
nnoremap('<DEL>', 'i<DEL>')
nnoremap('<Space><Space>', 'i<Space>')
