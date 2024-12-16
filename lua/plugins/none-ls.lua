return {
  "nvimtools/none-ls.nvim",
  config = function()
    local nonels = require("null-ls")
    nonels.setup({})

    vim.keymap.set("n", "<leader>df", vim.lsp.buf.format, {})
  end,
}
