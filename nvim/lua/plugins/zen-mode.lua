-- This file configures the `zen-mode.nvim` plugin, a modern and stable
-- alternative to `true-zen.nvim`.

return {
  "folke/zen-mode.nvim",
  
  -- The plugin will be lazy-loaded on the `ZenMode` command.
  cmd = "ZenMode",

  -- Configuration for zen-mode
  config = function()
    require("zen-mode").setup({
      -- Options for `zen-mode`
      -- You can customize the behavior here.
      -- For example, to set the width and height of the Zen window:
      window = {
        width = 0.5,
        height = 1,
      },
      
      -- To enable an extra plugin on entering ZenMode:
      -- on_enter = function()
      --   vim.cmd("Twilight")
      -- end,
      -- on_exit = function()
      --   vim.cmd("Twilight")
      -- end,
    })
  end,

  -- Keymap to toggle Zen Mode. This replaces the old `za` mapping.
  keys = {
    { "<leader>za", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  },
}

