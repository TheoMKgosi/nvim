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
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local on_attach = require("config.lsp").on_attach
      local lspconfig = require("lspconfig")

      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.dartls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.sqls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.marksman.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.dartls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
