vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.airline_theme= "solarized"
local opt = vim.opt

opt.termguicolors = true
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.number=true
opt.signcolumn = 'yes'

if vim.env.WSL_INTEROP then
  vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ["+"] = 'win32yank.exe -i --crlf',
      ["*"] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ["+"] = 'win32yank.exe -o --lf',
      ["*"] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }
elseif vim.loop.os_uname().sysname == "Darwin" then
  vim.g.clipboard=unnamed
end

