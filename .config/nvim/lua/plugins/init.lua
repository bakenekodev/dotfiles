return {
	-- colorschemes
	{
		"mcchrish/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = true,
	},

	-- core
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	{ "folke/neodev.nvim", opts = {} },
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
	},
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "junegunn/fzf", build = "./install --bin" },
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		opts = {
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
			window = {
				position = "right",
				mappings = {
					["<tab>"] = function(state)
						state.commands["open"](state)
						vim.cmd("Neotree reveal")
					end,
				},
			},
			close_if_last_window = true,
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.cmd("highlight! Cursor blend=100")
					end,
				},
				{
					event = "neo_tree_buffer_leave",
					handler = function()
						vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
					end,
				},
				{
					event = "file_opened",
					handler = function(file_path)
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
			["<tab>"] = function(state)
				state.commands["open"](state)
				vim.cmd("Neotree reveal")
			end,
		},
	},
	{
		"nvim-pack/nvim-spectre",
		build = false,
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
  },
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = true,
		opts = { mode = "cursor", max_lines = 7 },
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"rcarriga/nvim-notify",
	},
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	opts = {
	-- 		options = {
	-- 			mode = "buffers",
	-- 			close_command = "bdelete! %d",
	-- 		},
	-- 	},
	-- },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<C-l>",
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false, -- telescope did only one release, so use HEAD for now
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				enabled = vim.fn.executable("make") == 1,
			},
		},
		opts = {
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},
	},
	{ "pechorin/any-jump.vim" },
	{ "akinsho/toggleterm.nvim", version = "*", opts = {} },
	{
		"nvim-neotest/neotest",
		lazy = true,
		dependencies = {
			"olimorris/neotest-rspec",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rspec"),
				},
			})
		end,
	},
	-- nvim v0.8.0
	{
		{
			"kdheepak/lazygit.nvim",
			-- optional for floating window border decoration
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
	},
	{ "tpope/vim-rails" },
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	"wsdjeg/vim-fetch",
	"RRethy/nvim-treesitter-endwise",
	"sindrets/diffview.nvim",
  { "m4xshen/autoclose.nvim", opts = {} },
}
