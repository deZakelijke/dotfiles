function ColorMyPencils(color)
	color = color or "OceanicNext"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	if color == "OceanicNext" then
		vim.g.airline_theme = "oceanicnext"
		vim.g.oceanic_next_terminal_bold = 1
		vim.g.oceanic_next_terminal_italic = 1
	end

	vim.cmd("let g:airline#extensions#poetv#enabled = 1")
end

ColorMyPencils()
