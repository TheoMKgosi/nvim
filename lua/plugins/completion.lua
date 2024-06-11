return {
  {
    "williamboman/mason.nvim",
    config = function ()
      require('mason').setup()
    end
  },{

    "williamboman/mason-lspconfig.nvim",
    config = function ()
      require('mason-lspconfig').setup()
    end
  },{
    "folke/neodev.nvim",
    config = function ()
      require('neodev').setup()
    end
  },{
    'hrsh7th/cmp-nvim-lsp',
  },{
    'neovim/nvim-lspconfig',
    config = function ()
      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      lspconfig.lua_ls.setup {
        capabilities = capabilities
      }
      lspconfig.tsserver.setup {
        capabilities = capabilities
      }

      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition,{})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
       vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end

  },{
    'L3MON4D3/LuaSnip',
    dependencies = {'saadparwaiz1/cmp_luasnip','rafamadriz/friendly-snippets'}

  },{
    'hrsh7th/nvim-cmp',

    config = function ()
      local cmp = require('cmp')
      cmp.setup {
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },

        sources = cmp.config.sources{
          { name = 'nvim_lsp'},
          { name = 'luasnip' },
          { name = 'buffer'}
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true })
        }),
      }
    end
  }
}
