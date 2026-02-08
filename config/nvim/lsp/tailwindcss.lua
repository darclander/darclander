vim.lsp.config("tailwindcss", {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "html", "css", "scss", "sass", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = vim.fs.dirname(vim.fs.find({ "tailwind.config.js", "package.json", ".git" }, { upward = true })[1] or vim.loop.cwd()),
    settings = {
        tailwindCSS = {
            classAttributes = { "class", "className" },
            includeLanguages = {
                typescriptreact = "html",
                javascriptreact = "html",
            },
            validate = true,
        },
    },
    capabilities = _G.cmp_capabilities,
    on_attach = on_attach,
})


