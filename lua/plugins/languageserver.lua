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
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n','gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n','K', vim.lsp.buf.hover, opts)
          vim.keymap.set({'n','v'},'<leader>ca',vim.lsp.buf.code_action, opts)
        end
      })

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        capabilities = lsp_capabilities
      })
      lspconfig.cssls.setup({
        capabilities = lsp_capabilities
      })
      lspconfig.html.setup({
        capabilities = lsp_capabilities
      })
      lspconfig.eslint.setup({
        capabilities = lsp_capabilities
      })
      lspconfig.tsserver.setup({
        capabilities = lsp_capabilities
      })
      lspconfig.nginx_language_server.setup({
        capabilities = lsp_capabilities
      })
      lspconfig.tailwindcss.setup({
        capabilities = lsp_capabilities
      })
    end,
  }
}

