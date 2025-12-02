vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.1.9" },
	{ src = "https://github.com/jiaoshijie/undotree" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/ThePrimeagen/harpoon" },
})

vim.opt.undofile = true
vim.opt.undolevels = 9999

for old, new in pairs({ c = "h", a = "k", A = "K", i = "l", e = "j" }) do
	vim.keymap.set("n", old, new, { noremap = true })
	vim.keymap.set("n", new, old, { noremap = true })
	vim.keymap.set("v", old, new, { noremap = true })
	vim.keymap.set("v", new, old, { noremap = true })
end

vim.g.mapleader = " "
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>f", builtin.find_files, { desc = "Telescope find files" })

local undotree = require("undotree")
vim.keymap.set("n", "<Leader>u", undotree.toggle, { desc = "Toggle undotree" })

require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofumpt" },
	},
})

vim.keymap.set("n", "<Leader>h", require("harpoon.ui").toggle_quick_menu, { desc = "Toggle Harpoon quick menu" })
vim.keymap.set("n", "<Leader>m", require("harpoon.mark").add_file, { desc = "Add a file to Harpoon" })
vim.keymap.set("n", "<Leader>c", function()
	require("harpoon.ui").nav_file(1)
end, { desc = "Navigate to the first file in Harpoon" })
vim.keymap.set("n", "<Leader>a", function()
	require("harpoon.ui").nav_file(2)
end, { desc = "Navigate to the second file in Harpoon" })
vim.keymap.set("n", "<Leader>i", function()
	require("harpoon.ui").nav_file(3)
end, { desc = "Navigate to the third file in Harpoon" })
vim.keymap.set("n", "<Leader>e", function()
	require("harpoon.ui").nav_file(4)
end, { desc = "Navigate to the fourth file in Harpoon" })

vim.keymap.set("n", "<Leader>C", function()
	require("harpoon.term").gotoTerminal(1)
end, { desc = "Navigate to the first file in Harpoon" })
vim.keymap.set("n", "<Leader>A", function()
	require("harpoon.term").gotoTerminal(2)
end, { desc = "Navigate to the second file in Harpoon" })
vim.keymap.set("n", "<Leader>I", function()
	require("harpoon.term").gotoTerminal(3)
end, { desc = "Navigate to the third file in Harpoon" })
vim.keymap.set("n", "<Leader>E", function()
	require("harpoon.term").gotoTerminal(4)
end, { desc = "Navigate to the fourth file in Harpoon" })
require("rose-pine").setup({
	variant = "dawn",
})
vim.cmd("colorscheme rose-pine")
