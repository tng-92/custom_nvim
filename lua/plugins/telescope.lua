return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },

  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          height = 0.9, -- Height of the Telescope window as a fraction of the total window height
          width = 0.9, -- Width of the Telescope window as a fraction of the total window width
          prompt_position = "bottom",
        },
        file_ignore_patterns = {
          "node_modules",
          ".git",
          ".DS_Store",
          "build",
          "dist",
          ".next",
          "vendor",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = {
            "rg",
            "--no-ignore",
            "--files",
            "--hidden",
            "--glob=!**/.git/*",
            "--glob=!**/.next/*",
            "--glob=!**/.idea/*",
            "--glob=!**/.vscode/*",
            "--glob=!**/build/*",
            "--glob=!**/vendor/*",
            "--glob=!**/dist/*",
            "--glob=!**/yarn.lock",
            "--glob=!**/package-lock.json",
          },
        },
      },
    })
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>sG", builtin.git_files, {})
    vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
  end,
}
