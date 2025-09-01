return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Required for file icons
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  -- Configure neo-tree
  config = function()
    require("neo-tree").setup({
      window = {
        -- Set the width of the neo-tree window
        width = 30,
      },
      filesystem = {
        -- Automatically follow the currently active file in the tree
        follow_current_file = {
          enabled = true,
        },
      },
    })
  end,
  -- Set the keybinding directly within the plugin spec
  -- This is the recommended way to handle keymaps with lazy.nvim
  keys = {
    { "<leader>n", "<cmd>Neotree toggle<cr>", mode = "n", desc = "Toggle Neo-tree" },
  },
}

