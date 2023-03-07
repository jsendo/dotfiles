return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { 
     'nvim-lua/plenary.nvim',
      {'nvim-telescope/telescope-fzy-native.nvim', build = 'make'},
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    },
    --keys = {"C-t", "C-g", "C-b", "<leader>fh", "<leader>lr", "<leader>ld", "<leader>li"},
    config = function(plugin, opts)
      -- most of this is default settings
      local telescope = require("telescope")
      local wk = require("which-key")
      wk.register({
        l = {
          name = 'lsp',
          r = "references",
          d = "definitions",
          i = "implementations",
        }
      }, { prefix = "<leader>"})

      local builtin = require('telescope.builtin')
      local km = vim.keymap
      km.set('n', '<C-t>', builtin.git_files, { noremap = true })
      km.set('n', '<C-f>', builtin.find_files, {})
      km.set('n', '<C-g>', builtin.live_grep, {})
      km.set('n', '<C-b>', builtin.buffers, {})
      km.set('n', '<leader>fh', builtin.help_tags, {})
      km.set("n", "<leader>lr", builtin.lsp_references, {})
      km.set("n", "<leader>ld", builtin.lsp_definitions, {})
      km.set("n", "<leader>li", builtin.lsp_implementations, {})

      telescope.setup {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
            },
          },
        },
      }
      telescope.load_extension("fzy_native")
      --telescope.load_extension("fzf")
    end
  }
}
