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

      local servers = { "lua_ls", "ts_ls", "gopls", "dartls", "tailwindcss", "sqls", "marksman", "clangd", "html",
        "cssls" }

      for _, server in pairs(servers) do
        lspconfig[server].setup({
          on_attach = on_attach,
          capabilities = capabilities
        })
      end

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
