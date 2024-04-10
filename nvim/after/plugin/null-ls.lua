require("mason-null-ls").setup({
	ensure_installed = {
		"stylua",
		"black",
		"jq",
		"isort",
		"shellcheck",
	},
	methods = {
		formatting = true,
	},
})

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.jq,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.diagnostics.shellcheck,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
