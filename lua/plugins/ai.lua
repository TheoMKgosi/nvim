return {
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup({
        hooks = {
          -- example of adding command which writes unit tests for the selected code
          UnitTests = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
                .. "```{{filetype}}\n{{selection}}\n```\n\n"
                .. "Please respond by writing table driven unit tests for the code above."
            local agent = gp.get_command_agent()
            gp.Prompt(params, gp.Target.vnew, agent, template)
          end,
        }
      })

      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
      vim.keymap.set({ "n", "i" }, "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>")
      vim.keymap.set({ "n", "i" }, "<C-g>t", "<cmd>GpChatToggle tabnew<cr>")
      vim.keymap.set({ "n", "i" }, "<C-g>a", "<cmd>GpAppend<cr>")
      vim.keymap.set("v", "<C-g>a", ":<C-u>'<,'>GpAppend<cr>")
      vim.keymap.set({ "n", "i" }, "<C-g>x", "<cmd>GpContext<cr>")
    end,
  }
}
