local M = {}
local vimcmd
if vim.api ~= nil then
    vimcmd = vim.api.nvim_command
else
    vimcmd = vim.command
end

local globalListenerName = 'globallistenername' -- change this to be unique across multiple plugin name
local autocmdhandlers = {}

_G[globalListenerName] = function (name)
  autocmdhandlers[name]()
end

-- Key mapping
function M.map(mode, key, result, opts)
  vim.fn.nvim_set_keymap(
    mode,
    key,
    result,
    {
      noremap = true,
      silent = opts.silent or false,
      expr = opts.expr or false,
      script = opts.script or false
    }
  )
end

function M.augroup(group, fn)
  vim.api.nvim_command("augroup " .. group)
  vim.api.nvim_command("autocmd!")
  fn()
  vim.api.nvim_command("augroup END")
end

function M.get_color(synID, what, mode)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(synID)), what, mode)
end

function M.create(definitions)
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd("autocmd!")
    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
      vim.cmd(command)
    end
    vim.cmd("augroup END")
  end
end

function M.addEventListener (name, events, cb)
    autocmdhandlers[name] = cb
    vimcmd('augroup ' .. name)
    vimcmd('autocmd!')
    for _, v in ipairs(events) do
        local cmd = 'lua ' .. globalListenerName .. '("' .. name ..'")'
        vimcmd('au ' .. v .. ' ' .. cmd)
    end
    vimcmd('augroup end')
end

function M.removeEventListener (name)
    vimcmd('augroup ' .. name)
    vimcmd('autocmd!')
    vimcmd('augroup end')
    autocmdhandlers[name] = nil
end

return M
