vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus"

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

local gh = function(repo)
	return "https://github.com/" .. repo
end

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

require("neo-tree").setup({
	filesystem = {
		follow_current_file = { enabled = true },
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = true,
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle filesystem reveal left<cr>", { desc = "Explorer" })

require("telescope").setup({})

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

require("gitsigns").setup({})
require("Comment").setup({})
require("nvim-surround").setup({})
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

vim.api.nvim_create_user_command("Format", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format current buffer" })

vim.cmd("colorscheme blue")
