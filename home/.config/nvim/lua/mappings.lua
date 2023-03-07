vim.g.mapleader = " "
vim.g.maplocalleader = " "
--vnoremap  <leader>y  "+y
--nnoremap  <leader>Y  "+yg_
--nnoremap  <leader>y  "+y
--nnoremap  <leader>yy  "+yy
--vnoremap  <leader>c :OSCYank<CR>



local km = vim.keymap
km.set('n', '<leader>y', '"+y', { noremap=true })
km.set('v', '<leader>y', '"+y', { noremap=true })

--vim.keymap.set('n', '<Leader>test1', '<Cmd>echo "test"<CR>')
-- :nnoremap <Leader>test <Cmd>echo "test"<CR>
--km.set('n', '<C-t>', ':Telescope git_files<CR>', { noremap = true })
--km.set('n', '<C-f>', ':Telescope find_files<CR>', { noremap = true })
--km.set('n', '<C-g>', ':Telescope live_grep<CR>', { noremap = true })
--km.set('n', '<C-b>', ':Telescope buffers<CR>', { noremap = true })
--km.set('n', '<C-g>', ':Files<CR>', { noremap = true })
--km.set('n', '<C-f>', ':Rg<CR>', { noremap = true })
--km.set('n', '<C-b>', ':Buffers<CR>', { noremap = true })

