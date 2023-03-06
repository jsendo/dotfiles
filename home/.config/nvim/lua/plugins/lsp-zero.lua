local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

return {
  { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    ---@type TSConfig
    opts = {
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
     context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = { "bash", "dockerfile", "diff", "go", "javascript", "lua", "markdown", "python","rust", "typescript", "vue", "yaml" },
      auto_install = true,
    },
    ---@param opts TSConfig
    config = function(plugin, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {'folke/which-key.nvim',
    config = true
  },
  { 
    "zbirenbaum/copilot.lua",
    lazy = false,
    opts = {
      suggestion = {
	      enabled = false,
      },
      panel = {
      	enabled = false,
      },

    },
    config = true
  },
  { "zbirenbaum/copilot-cmp",
    dependencies = "zbirenbaum/copilot.lua",
    lazy = false,
    config = true
  },

  {
    'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    {'onsails/lspkind.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional

    {'zbirenbaum/copilot-cmp'},
  },
  config = function(plugin, opts)
    --local lsp = require('lsp-zero').preset({
    --  name = 'minimal',
    --  set_lsp_keymaps = true,
    --  manage_nvim_cmp = true,
    --  suggest_lsp_servers = false,
    --})
    local lsp = require('lsp-zero')
    lsp.preset('recommended')
    local lspkind = require('lspkind')
    local cmp = require'cmp'

    local cmp_mappings = lsp.defaults.cmp_mappings({
      ["<C-Space>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if not entry then
            cmp.select_next_item()
          else
            cmp.confirm()
          end
        else
          fallback()
        end
      end, {"i", "s", "c"}),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
      ["<Tab>"] = vim.schedule_wrap(function(fallback)
        if cmp.visible() and has_words_before() then
        --if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end),
    })

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings,
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          symbol_map = {
            Copilot = "",
          }
        })
      }
    })

    -- (Optional) Configure lua language server for neovim
    lsp.nvim_workspace()
          lsp.configure('solargraph', {
        force_setup = true
      })

    lsp.setup()
  end,
  }
}
