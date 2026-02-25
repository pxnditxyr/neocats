local vue_language_server_path = os.getenv("VUE_TS_PLUGIN_PATH")
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}

return {
	cmd = { "vtsls", "--stdio" },
	root_markers = {
		"package-lock.json",
		"yarn.lock",
		"pnpm-lock.yaml",
		"bun.lockb",
		"bun.lock",
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
	},
	single_file_support = true,

	on_attach = function(client)
		if client.server_capabilities.semanticTokensProvider then
			local semantic = client.config.filetypes and vim.tbl_contains(client.config.filetypes, "vue")
			if semantic then
				if vim.bo.filetype == "vue" then
					client.server_capabilities.semanticTokensProvider.full = false
				end
			end
		end
	end,
	settings = {
		typescript = {
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
			preferences = {
				includeCompletionsForModuleExports = true,
				allowRenameOfImportPath = true,
			},
		},
		javascript = {
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
			preferences = {
				includeCompletionsForModuleExports = true,
				allowRenameOfImportPath = true,
			},
		},
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
}
