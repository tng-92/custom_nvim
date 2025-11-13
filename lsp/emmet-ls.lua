local blink = require("blink.cmp")

return {
    cmd = { "emmet-ls", "--stdio" },
    filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "blade",
    },
    root_markers = { ".git", "package.json" },
    init_options = {
        showExpandedAbbreviation = "always",
        showAbbreviationSuggestions = true,
        showSuggestionsAsSnippets = true,
    },
    capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        blink.get_lsp_capabilities()
    ),
}
