return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup({})
      vim.keymap.set("n", "<leader>pv", function()
        if vim.bo.filetype == "oil" then
          vim.cmd("b#") -- Go back to the previous buffer
        else
          require("oil").open() -- Open oil.nvim file explorer
        end
      end)

    end

  }
}
