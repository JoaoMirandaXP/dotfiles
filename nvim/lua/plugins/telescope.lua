return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
			             -- or, branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- Get the telescope module
        local telescope = require("telescope.builtin")

        -- Set keymaps
        vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Find buffers" })
        vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Find help tags" })

        -- Telescope setup options (you can customize these)
        require("telescope").setup({
            defaults = {
        -- Change the layout or other options
        -- For example, to make the preview window smaller:
        -- layout_config = {
        --   preview_width = 0.5,
        -- },
            },
        })
  end,
}
