local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.keymap.set({"n"}, "]d", vim.diagnostic.goto_next, {})
vim.keymap.set({"n"}, "[d", vim.diagnostic.goto_prev, {})
