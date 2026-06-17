-- Leader keys need to be set before plugins or mappings are configured.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Core editing behavior.
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.timeoutlen = 400
vim.opt.updatetime = 250

-- Search and command feedback.
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.smartcase = true

-- Window, gutter, and scrolling ergonomics.
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smoothscroll = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.virtualedit = "block"

-- Text display.
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.showmode = false
vim.opt.wrap = false

-- Persistence and swap/write behavior.
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.writebackup = false

-- Keep common startup and completion messages quiet.
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Small helpers used by formatter configuration.
local function find_up(names, startpath)
	return vim.fs.find(names, { upward = true, path = startpath })[1]
end

local function project_root(startpath)
	local marker = find_up({ ".git", "Gemfile", "package.json", ".rubocop.yml", ".standard.yml" }, startpath)
	return marker and vim.fs.dirname(marker) or vim.loop.cwd()
end

local function file_exists(path)
	return path and vim.uv.fs_stat(path) ~= nil
end

vim.treesitter.language.register("json", { "jsonc" })

-- Native package management. Neovim installs these into its vim.pack directory
-- and tracks exact revisions in nvim-pack-lock.json.
local gh = function(repo)
	return "https://github.com/" .. repo
end

-- Preserve lazy.nvim's treesitter build hook with native pack events.
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind
		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			vim.schedule(function()
				if not ev.data.active then
					vim.cmd.packadd("nvim-treesitter")
				end
				pcall(vim.cmd, "TSUpdate")
			end)
		end
	end,
})

vim.pack.add({
	gh("nvim-treesitter/nvim-treesitter"),
	{ src = gh("nvim-neo-tree/neo-tree.nvim"), version = "v3.x" },
	gh("nvim-lua/plenary.nvim"),
	gh("nvim-tree/nvim-web-devicons"),
	gh("MunifTanjim/nui.nvim"),
	gh("nvim-telescope/telescope.nvim"),
	gh("lewis6991/gitsigns.nvim"),
	gh("numToStr/Comment.nvim"),
	gh("kylechui/nvim-surround"),
	gh("mason-org/mason.nvim"),
	gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
	gh("stevearc/conform.nvim"),
}, { confirm = false, load = true })

-- Syntax highlighting and indentation.
require("nvim-treesitter").setup({
	ensure_installed = {
		"bash",
		"json",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"query",
		"regex",
		"vim",
		"vimdoc",
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
})

-- File explorer.
require("neo-tree").setup({
	event_handlers = {
		{
			event = "file_opened",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end,
		},
	},
	filesystem = {
		follow_current_file = { enabled = true },
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = true,
	},
})

-- Fuzzy finding.
require("telescope").setup({})

-- Lightweight editing integrations.
require("gitsigns").setup({})
require("Comment").setup({})
require("nvim-surround").setup({})

-- External tools used by formatters.
require("mason").setup({})

require("mason-tool-installer").setup({
	ensure_installed = {
		"prettier",
		"standardrb",
		"rubocop",
		"stylua",
		"shfmt",
	},
	auto_update = true,
	run_on_start = true,
	start_delay = 3000,
	debounce_hours = 12,
})

-- Formatting. Ruby is formatted after save to avoid blocking writes in larger
-- projects; other filetypes format before save with a short timeout.
require("conform").setup({
	format_on_save = function(bufnr)
		if vim.bo[bufnr].filetype == "ruby" then
			return nil
		end
		return {
			timeout_ms = 1000,
			lsp_format = "fallback",
		}
	end,
	format_after_save = function(bufnr)
		if vim.bo[bufnr].filetype ~= "ruby" then
			return nil
		end
		return {
			lsp_format = "fallback",
		}
	end,
	formatters_by_ft = {
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		markdown = { "prettier" },
		yaml = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		lua = { "stylua" },
		sh = { "shfmt" },
		ruby = { "rubocop", "standardrb" },
	},
	formatters = {
		rubocop = {
			condition = function(_, ctx)
				local root = project_root(ctx.dirname)
				return file_exists(root .. "/bin/rubocop") or file_exists(root .. "/.rubocop.yml")
			end,
		},
		standardrb = {
			command = function(_, ctx)
				local root = project_root(ctx.dirname)
				if file_exists(root .. "/bin/standardrb") then
					return root .. "/bin/standardrb"
				end
				return "standardrb"
			end,
		},
	},
})

-- User commands and keymaps.
vim.api.nvim_create_user_command("Format", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format current buffer" })

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle filesystem reveal left<cr>", { desc = "Explorer" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

-- Built-in colorscheme.
vim.cmd("colorscheme blue")
