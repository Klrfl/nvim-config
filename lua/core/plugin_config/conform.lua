require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },

		-- Use a sub-list to run only the first available formatter
		html = { "prettier" },
		css = { "prettier" },
		vue = { "prettier" },
		astro = { "prettier" },
		javascript = { "prettier" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
