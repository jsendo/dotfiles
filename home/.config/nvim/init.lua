vim.g.ruby_host_prog = "/Users/jason/.asdf/installs/ruby/3.1.3/bin/neovim-ruby-host"
vim.g.node_host_prog = "/Users/jason/.asdf/installs/nodejs/19.4.0/lib/node_modules/neovim/bin/cli.js"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("mappings")
require("lazy").setup("plugins")
require("options")
