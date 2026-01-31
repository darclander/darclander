return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	version = "v0.10.0",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autotage = { enable = true },
			ensure_installed = { 
				"cpp",
				"lua",
			},
			auto_install  = false,
		})
	end
}

