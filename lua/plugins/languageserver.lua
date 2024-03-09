return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {"lua_ls"}
			})
		end

	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
			lspconfig.lua_ls.setup {
        capabilities = capabilities
      }
      lspconfig.nginx_language_server.setup {
        capabilities = capabilities
      }
      lspconfig.svelte.setup {
        capabilities = capabilities
      }
      lspconfig.tailwindcss.setup {
        capabilities = capabilities
      }
      lspconfig.pyright.setup {
        capabilities = capabilities
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n','gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n','K', vim.lsp.buf.hover, opts)
          vim.keymap.set({'n','v'},'<leader>ca',vim.lsp.buf.code_action, opts)
        end
      })
				end
	}
}

