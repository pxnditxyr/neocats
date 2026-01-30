vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gd", require("snacks").picker.lsp_definitions, "[G]oto [D]efinition")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		-- map("K", function()
		-- 	vim.lsp.buf.hover({ border = "rounded" })
		-- end, "Hover Documentation")

		map("gr", require("snacks").picker.lsp_references, "[G]oto [R]eferences")
		map("gI", require("snacks").picker.lsp_implementations, "[G]oto [I]mplementation")
		-- map( "<leader>D", require( "snacks" ).picker.lsp_type_definitions, "Type [D]efinition" )
		map("<leader>ds", require("snacks").picker.lsp_symbols, "[D]ocument [S]ymbols")
		map("<leader>ws", require("snacks").picker.lsp_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

		map("<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, "[F]ormat buffer")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})

vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

-- Core LSPs
vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("yamlls")
vim.lsp.enable("jsonls")
vim.lsp.enable("dartls")
vim.lsp.enable("nixd", require("nixCatsUtils").isNixCats)

-- JS/TS based LSP
-- vim.lsp.enable("ts_ls")  -- ❌ DESHABILITADO: Usar vtsls en su lugar (más rápido, menos bugs)
vim.lsp.enable("vtsls")  -- ✅ Modern TS LSP (2026) - Reemplaza ts_ls
vim.lsp.enable("astro")
vim.lsp.enable("denols")
vim.lsp.enable("svelte")
vim.lsp.enable("angularls")
vim.lsp.enable("prismals")
-- NOTA: Biome se usa como FORMATTER en conform.nvim, no como LSP aquí
-- Esto evita conflictos: vtsls = diagnostics/autocomplete, biome = format/lint

-- CSS based LSP
vim.lsp.enable("tailwindcss")
vim.lsp.enable("cssls")

-- Other LSPs
vim.lsp.enable("phpactor")
vim.lsp.enable("gopls", require("nixCatsUtils").enableForCategory("go"))
vim.lsp.enable("rust_analyzer", require("nixCatsUtils").enableForCategory("rust"))

-- 2026 Modern LSPs
vim.lsp.enable("marksman")  -- Markdown LSP
vim.lsp.enable("harper_ls")  -- Grammar checker
vim.lsp.enable("taplo")     -- TOML LSP
