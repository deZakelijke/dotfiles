local lsp_zero = require("lsp-zero")
require("lspconfig").intelephense.setup({})

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.setup()

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"rust_analyzer",
		"ruff",
		"pyright",
	},
	handlers = {
		lsp_zero.default_setup,
		require("lspconfig").ruff.setup({}),
	},
})

-- lsp_zero.format_on_save({
--     format_opts = {
--         async = true,
--         timeout_ms = 10000,
--     },
--
--     servers = {
--         ['ruff'] = {'python'},
--         ['rust_analyzer'] = {'rust'},
--     }
-- })

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("lspconfig")["pyright"].setup({
	capabilities = capabilities,
	on_attach = lsp_zero.default_on_attach,
})

vim.keymap.set("n", "<leader>r", ":lua vim.lsp.buf.rename()<cr>")
