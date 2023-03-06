return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { 
     'nvim-lua/plenary.nvim',
     --{'nvim-telescope/telescope-fzy-native.nvim', build = 'make'},
     {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    },
    keys = {"<leader>t", "<leader>g", "<leader>b", "<leader>fh", "<leader>lr", "<leader>ld", "<leader>li"},
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
      vim.keymap.set('n', '<leader>t', builtin.git_files, {})
      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set("n", "<leader>lr", builtin.lsp_references, {})
      vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, {})
      vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, {})

      telescope.setup {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
            },
          },
        },
      }
      --telescope.load_extension("fzy_native")
      telescope.load_extension("fzf")
    end
  }
}
