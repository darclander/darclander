return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" },
	config = function()
		local cmp_ok, cmp = pcall(require, "cmp")
		if not cmp_ok then return end

		local capabilities_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if not capabilities_ok then return end

		_G.cmp_capabilities = cmp_nvim_lsp.default_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		)

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-k>"] = cmp.mapping(function(fallback)
					vim.lsp.buf.signature_help()
				end, { "i", "s" }), -- triggers signature help in insert & select mode
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			},
			window = {
				documentation = cmp.config.window.bordered({
					scrollbar = false,
					border = "rounded",
					winhighlight = "Normal:NormalFloat,FLoatBorder:FloatBorder",
				}),
			},
			experimental = {},     -- explicitly define experimental table
		})
	end,
}

