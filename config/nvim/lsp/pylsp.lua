vim.lsp.config("pylsp", {
  cmd = { "/bin/pylsp" },

  root_dir = vim.fs.find(
    { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
    { upward = true }
  )[1] or vim.loop.cwd(),

  capabilities = _G.cmp_capabilities,
  on_attach = on_attach,

  settings = {
    pylsp = {
      plugins = {
        autopep8 = { enabled = false },
        flake8 = { enabled = false },
        pydocstyle = { enabled = false },

        pylint = { 
			enabled = true,
			executable = "/usr/bin/pylint",
		},
        yapf = { enabled = true },
        pylsp_mypy = { enabled = true },
      },
    },
  },
})

