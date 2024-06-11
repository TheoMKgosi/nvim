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

    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    --For luasnip users.
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    config = function ()

      
      -- Set up nvim-cmp.
      local cmp = require('cmp')

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        })
      })
      
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
      

      enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
          return true
        else
          return not context.in_treesitter_capture("comment") 
            and not context.in_syntax_group("Comment")
        end
      end
    end
  },
}
