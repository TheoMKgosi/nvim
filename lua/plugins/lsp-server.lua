return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({ })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({})
    end,
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim", "saghen/blink.cmp" },
    config = function()
      -- Set up lspconfig.
      local capabilities = require("blink.cmp").get_lsp_capabilities()
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
}
