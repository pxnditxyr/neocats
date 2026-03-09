local border = "rounded"

vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
	config = config or {}
	config.border = border
	return vim.lsp.handlers.hover(err, result, ctx, config)
end

vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
	config = config or {}
	config.border = border
	return vim.lsp.handlers.signature_help(err, result, ctx, config)
end

vim.diagnostic.config({
	float = {
		border = border,
		source = true,
	},
})
