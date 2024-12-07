return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{

		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({})
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "folke/neodev.nvim" },
		config = function()
			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						conpletion = {
							callSnippet = "Replace",
						},
					},
				},
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.dartls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.sqls.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				sources = {
					{ name = "path" },
					{ name = "luasnip" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "nvim_lsp", keyword_length = 2 },
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),

				formatting = {
					fields = { "menu", "abbr", "kind" },
					expandable_indicator = false,
					format = function(entry, item)
						local menu_icon = {
							nvim_lsp = "λ",
							luasnip = "",
							buffer = "Ω",
							path = "",
						}
						item.menu = menu_icon[entry.source.name]
						return item
					end,
				},
			})
		end,
	},
}
