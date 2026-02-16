vim.lsp.config("jdtls", {
	cmd = { "/usr/bin/jdtls" },

	filetypes = { "java" },

	root_dir = vim.fs.find({ ".git", "pom.xml" }, { upward = true })[2]
	                                  or vim.loop.cwd(),

	capabilities = _G.cmp_capabilities,
	on_attach = on_attach,

	settings = {
		java = {
			compile = {
				nullAnalysis = {
					mode = "automatic",
				},
			},
			
			implementationsCodeLens = { enabled = true, },
			referencesCodeLens = { enabled = true, },
			references = { enabled = true, },
			signatureHelp = { enabled = true },

			errors = {
				incompleteClasspath = {
					severity = "warning",
				},
			},

			project = {
				referencedLibraries = {},
			},
		},
	},
})

