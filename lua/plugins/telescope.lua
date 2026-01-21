return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },

  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          height = 0.9,
          width = 0.9,
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

    -- your existing Telescope mappings
    vim.keymap.set("n", "<leader>sf", builtin.git_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

    vim.keymap.set(
      "n",
      "<leader>/",
      builtin.current_buffer_fuzzy_find,
      { desc = "[/] Fuzzily search in current buffer" }
    )

    vim.keymap.set(
      "n",
      "<leader>ss",
      builtin.find_files,
      { noremap = true, silent = true, desc = "[S]earch non git un[S]taged" }
    )

    vim.keymap.set("n", "<leader>sl", function()
      builtin.find_files({ cwd = "storage/logs" })
    end, { noremap = true, silent = true, desc = "[S]earch [L]ogs in cwd" })

    vim.keymap.set("n", "<leader>se", function()
      builtin.live_grep({
        additional_args = function()
          return { "-g", "*.env" }
        end,
      })
    end, { desc = "Search only in *.env files" })

    -- LSP-specific keymaps scoped to buffers when a server attaches
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
      callback = function(event)
        local tb = require("telescope.builtin")
        local function map(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", tb.lsp_definitions, "[G]oto [D]efinition")
        map("gr", tb.lsp_references, "[G]oto [R]eferences")
        map("gI", tb.lsp_implementations, "[G]oto [I]mplementation")
        map("<leader>D", tb.lsp_type_definitions, "Type [D]efinition")
        map("<leader>ds", tb.lsp_document_symbols, "[D]ocument [S]ymbols")
        map("<leader>ws", tb.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      end,
    })
  end,
}
