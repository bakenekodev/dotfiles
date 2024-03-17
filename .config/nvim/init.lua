local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local opt = vim.opt
opt.termguicolors = true
opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

require("lazy").setup("plugins")
require("neodev").setup({})
require("telescope").load_extension("fzf")

-- base

vim.cmd("colorscheme tokyobones")
vim.cmd("set number")

-- plugins

vim.g.any_jump_ignored_files = { "*_spec.rb" }
require("mason").setup()
require("mason-lspconfig").setup()

-- language servers
local lspconfig = require("lspconfig")
-- lspconfig.ruby_ls.setup({})
lspconfig.solargraph.setup({})
lspconfig.rust_analyzer.setup({})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		ruby = { "rubocop" },
	},
})

local slow_format_filetypes = { ".rb" }
require("conform").setup({
	format_on_save = function(bufnr)
		if slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		local function on_format(err)
			if err and err:match("timeout$") then
				slow_format_filetypes[vim.bo[bufnr].filetype] = true
			end
		end

		return { timeout_ms = 200, lsp_fallback = true }, on_format
	end,

	format_after_save = function(bufnr)
		if not slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		return { lsp_fallback = true }
	end,
})

-- keybindings

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>BufferPrevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferNext<cr>", { desc = "Next buffer" })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set({ "n", "i", "t" }, "<C-t>", "<cmd>ToggleTerm direction=float<cr>")

vim.keymap.set({ "n" }, "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })

local wk = require("which-key")

wk.register({
	["<leader>"] = {
		p = {
			name = "Plugins",
			o = { "<cmd>Lazy<cr>", "Open" },
			i = { "<cmd>Lazy install<cr>", "Install" },
		},
		s = {
			name = "Find",
			f = { "<cmd>FzfLua files<cr>", "Files" },
			w = { "<cmd>FzfLua grep<cr>", "Word" },
			t = { "<cmd>FzfLua grep_visual<cr>", "Text" },
			r = { "<cmd>Telescope oldfiles<cr>", "Recent" },
		},
		g = {
			name = "Git",
			g = { "<cmd>LazyGit<cr>", "Lazygit" },
			d = { "<cmd>Gitsigns diffthis<cr>", "Diff" },
			r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset buffer" },
			R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer" },
			b = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
			B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Line blame" },
			p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview" },
			P = { "<cmd>Gitsigns preview_hunk_inline<cr>", "Inline preview" },
			j = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
			o = { "<cmd>Telescope git_status<cr>", "Open" },
		},
		b = {
			name = "Buffers",
			c = { "<cmd>bw<cr>", "Close" },
		},
		l = {
			name = "LSP",
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Buffer symbols" },
		},
		t = {
			name = "Test",
			t = { "<cmd>lua require('neotest').run.run()<cr>", "Nearest" },
			f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
			i = { "<cmd>lua require('neotest').output.open()<cr>", "Inspect" },
			n = { "<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>", "Next" },
			o = { "<cmd>lua require('neotest').su.next({ status = 'passed' })<CR>", "Next" },
			b = {
				function()
					vim.cmd("w")
					local file = vim.fn.expand("%") .. ":" .. vim.fn.line(".")
					vim.cmd("TermExec direction=float cmd='t " .. file .. "'")
				end,
				"Line with bp",
			},
			j = { "<cmd>A<cr>", "Jump" },
		},
	},
})

wk.register({
	["<leader>c"] = { "<cmd>BufferClose<cr>", "Close" },
	["<leader>f"] = { "<cmd>FzfLua files<cr>", "Files" },
	["<leader>h"] = { "<cmd>noh<cr>", "Turn off highlighting" },
	["<leader>e"] = { "<cmd>Neotree<cr>", "Tree" },
	["<leader>w"] = { "<cmd>w<cr>", "Save" },
	["<leader>q"] = { "<cmd>q<cr>", "Quit" },
})
