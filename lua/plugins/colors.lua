-- Centralised theme list
-- You can then switch themes any time with:
--    :colorscheme tokyonight-night
--    :colorscheme catppuccin
--    :colorscheme onedark
-- etc.

return {
  -- 🟣 TokyoNight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {}, -- you can add { style = "moon" } etc.
  },

  -- 🐱 Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
        },
      })
    end,
  },

  -- ⚫ OneDark
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup()
    end,
  },

  -- 🟠 Gruvbox
  {
    "npxbr/gruvbox.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.g.gruvbox_contrast_dark = "hard"
      vim.g.gruvbox_italic = 1
    end,
  },

  -- 🌌 Sonokai
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "andromeda"
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_transparent_background = 1
    end,
  },

  -- 🟡 Ayu
  { "ayu-theme/ayu-vim" },

  -- 💻 Cyberdream
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").colorscheme()
    end,
  },

  -- 🧜 Material
  {
    "marko-cerovac/material.nvim",
  },

  -- ⚪ Modus
  {
    "miikanissi/modus-themes.nvim",
    config = function()
      require("modus-themes").setup({
        style = "auto",
        transparent = false,
      })
    end,
  },

  -- 🌹 Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },

  -- 🦊 Nightfox
  { "EdenEast/nightfox.nvim" },

  -- ❄️ Nord
  {
    "shaunsingh/nord.nvim",
    config = function()
      require("nord").set()
    end,
  },
}
