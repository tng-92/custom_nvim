local selected_theme = "gruvbox"

if selected_theme == "catppuccin" then
	return {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "frappe",
				},
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
					-- lazygit = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})

			-- load the colorscheme here
			vim.cmd([[colorscheme catppuccin]])
		end,
	}
end

if selected_theme == "onedark" then
	return {
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup()
			vim.cmd([[colorscheme onedark]])
		end,
	}
end

if selected_theme == "tokyonight" then
	return {
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup()
			vim.cmd([[colorscheme tokyonight]])
		end,
	}
end

if selected_theme == "gruvbox" then
	return {
		"npxbr/gruvbox.nvim",
		requires = { "rktjmp/lush.nvim" },
		config = function()
			vim.g.gruvbox_transparent_bg = 0
			vim.g.gruvbox_contrast_dark = "hard"
			vim.g.gruvbox_contrast_light = "hard"
			vim.g.gruvbox_italic = 1
			vim.g.gruvbox_invert_selection = 0
			vim.g.gruvbox_italicize_strings = 0
			vim.g.gruvbox_italicize_comments = 0
			vim.g.gruvbox_dark_sidebar = 1
			vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }
			vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }
			vim.cmd([[colorscheme gruvbox]])
		end,
	}
end

if selected_theme == "sonokai" then
	return {
		"sainnhe/sonokai",
		priority = 1000,
		config = function()
			vim.g.sonokai_style = "andromeda"
			vim.g.sonokai_enable_italic = 1
			vim.g.sonokai_disable_italic_comment = 0
			vim.g.sonokai_transparent_background = 1
			vim.cmd("colorscheme sonokai")
		end,
	}
end

if selected_theme == "ayu" then
	return {
		"ayu-theme/ayu-vim",
		config = function()
			vim.g.ayucolor = "mirage"
			vim.cmd([[colorscheme ayu]])
		end,
	}
end

if selected_theme == "cyberdream" then
	return {
		"scottmckendry/cyberdream.nvim",
		config = function()
			require("cyberdream").colorscheme()
		end,
		lazy = false,
		priority = 1000,
	}
end

if selected_theme == "material" then
	return {
		"marko-cerovac/material.nvim",
		config = function()
			vim.g.material_style = "deep ocean"
			vim.g.material_italic_comments = true
			vim.g.material_italic_keywords = true
			vim.g.material_italic_functions = true
			vim.g.material_italic_variables = false
			vim.g.material_contrast = true
			vim.g.material_borders = false
			vim.g.material_disable_background = false
			vim.g.material_custom_colors = {}
			vim.cmd([[colorscheme material]])
		end,
	}
end

if selected_theme == "rose-pine" then
	return {
		"rose-pine/neovim",
		config = function()
			vim.g.rose_pine_variant = "moon"
			vim.cmd([[colorscheme rose-pine]])
		end,
	}
end

if selected_theme == "nightfox" then
	return {
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").load()
		end,
	}
end

if selected_theme == "nord" then
	return {
		"shaunsingh/nord.nvim",
		config = function()
			require("nord").set()
		end,
	}
end
