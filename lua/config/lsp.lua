local on_attach = function(client, bufnr)
    local bufmap = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    bufmap("n", "gd", vim.lsp.buf.definition, "Go to Definition")
    bufmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
    bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
    bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
end

-- Export function to be used in LSP setup
return {
  on_attach = on_attach,
}
