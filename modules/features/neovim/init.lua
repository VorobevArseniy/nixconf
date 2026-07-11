local gh = function(path) return "https://github.com/" .. path end

vim.pack.add({
	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("nvim-mini/mini.pick") },
	{ src = gh("nvim-mini/mini.ai") },
	{ src = gh("nvim-mini/mini.pairs") },
	{ src = gh("nvim-mini/mini.surround") },
	{ src = gh("nvim-mini/mini.indentscope") },
	{ src = gh("neovim/nvim-lspconfig") },
	{ src = gh("stevearc/conform.nvim") },
	{ src = gh("RRethy/base16-nvim") },
	{ src = gh("chomosuke/typst-preview.nvim") },
	{ src = gh("nvim-tree/nvim-web-devicons") },
	{ src = gh("romus204/tree-sitter-manager.nvim") },
})

vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = true
vim.o.signcolumn = "no"

vim.o.termguicolors = true
vim.o.scrolloff = 15
vim.o.switchbuf = "usetab"
vim.o.undofile = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.g.have_nerd_font = true

vim.o.autoindent = false
vim.o.smartindent = true
vim.o.formatoptions = "rqnl1j"
vim.o.smartcase = true
vim.o.spelloptions = 'camel'
vim.o.iskeyword = '@,48-57,_,192-255,-'

vim.o.confirm = true
vim.o.swapfile = false
vim.o.linebreak = true
vim.o.smoothscroll = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.inccommand = "split"
vim.o.updatetime = 300
vim.o.timeoutlen = 500

vim.o.showmode = false
vim.o.splitkeep = "screen"
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,' ..
		'фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

-- disable indent scope lines by default
vim.g.miniindentscope_disable = true

require("base16-colorscheme").setup({
	base00 = "#2e3440",
	base01 = "#39404f",
	base02 = "#444c5e",
	base03 = "#465780",
	base04 = "#7e8188",
	base05 = "#cdcecf",
	base06 = "#abb1bb",
	base07 = "#e7ecf4",
	base08 = "#bf616a",
	base09 = "#c9826b",
	base0A = "#ebcb8b",
	base0B = "#a3be8c",
	base0C = "#88c0d0",
	base0D = "#81a1c1",
	base0E = "#b48ead",
	base0F = "#bf88bc",
})

local function show_args()
	local args = vim.fn.argv()
	for i, f in ipairs(args) do
		local prefix = (i == vim.fn.argidx() + 1) and "▶" or " "
		vim.notify(string.format("%s %d: %s", prefix, i, vim.fn.fnamemodify(f, ":~")))
	end
end

vim.keymap.set('n', '<leader>a', function()
	vim.cmd('argadd ' .. vim.fn.fnameescape(vim.fn.expand('%:p')))
	vim.cmd('argdedup')
end)

vim.keymap.set('n', '<C-e>', show_args)

vim.keymap.set('n', '<C-j>', function() vim.cmd('silent! 1argument') end)
vim.keymap.set('n', '<C-k>', function() vim.cmd('silent! 2argument') end)
vim.keymap.set('n', '<C-l>', function() vim.cmd('silent! 3argument') end)
vim.keymap.set('n', '<C-;>', function() vim.cmd('silent! 4argument') end)

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d')

vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<CR>")

vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set({ "n", "v" }, "<leader>le", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set({ "n", "v" }, "<leader>ti",
	function() vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable end)

-- vim.pack doesn't delete inactive plugins automatically. A bit hacky but works
vim.keymap.set("n", "<leader>cp", function()
	vim.pack.del(vim.iter(vim.pack.get()):filter(function(x) return not x.active end):map(function(x) return x.spec.name end)
		:totable())
end)

vim.keymap.set({ "n", "t" }, "<M-e>", ":split<CR>")
vim.keymap.set({ "n", "t" }, "<M-o>", ":vsplit<CR>")
vim.keymap.set({ "t" }, "<esc>", "<C-\\><C-n>")

-- vim.lsp.enable({ "biome", "lua_ls", "gopls", "tinymist", "ts_ls", "astro", "rust_analyzer", "clangd", "tailwindcss",
-- 	"emmet_language_server", "nixd" })

vim.diagnostic.config {
	underline = { severity = { min = 'HINT', max = 'ERROR' } },
	virtual_lines = {
		current_line = true,
	},
	update_in_insert = false,
}

require('vim._core.ui2').enable({})

require("oil").setup {
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
	}
}

require('mini.pick').setup()
require('mini.ai').setup()
require('mini.pairs').setup({
	modes = { command = true },
})
require('mini.surround').setup()
require('mini.indentscope').setup({
	symbol = '│',
	options = {
		try_as_border = true,
	},
})

require("tree-sitter-manager").setup({
	ensure_installed = { "lua", "rust", "markdown", "tsx", "typescript", "json", "go", "typst", "html" }
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua", lsp_format = "fallback" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "biome", stop_after_first = true },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end
		if client:supports_method('textDocument/inlayHint') then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end

		if client:supports_method('textDocument/completion') then
			vim.o.complete = 'o,.,w,b,u'
			vim.o.completeopt = 'menu,menuone,popup,noinsert'
			vim.o.pumheight = 15
			vim.lsp.completion.enable(true, client.id, args.buf, {
				autotrigger = true,
				convert = function(item)
					return {
						abbr = item.label:gsub("%b()", ""),
						menu = item.labelDetails and item.labelDetails.description or "",
					}
				end
			})
		end
	end
})

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank() end,
})
