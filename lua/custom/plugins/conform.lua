return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		-- format_on_save = {
		-- 	timeout_ms = 500,
		-- 	lsp_fallback = true,
		-- },
		formatters_by_ft = {
			lua = { "stylua" },
			nix = { "nixfmt" },
			javascript = { "biome", "prettierd", stop_after_first = true },
			typescript = { "biome", "prettierd", stop_after_first = true },
			javascriptreact = { "biome", "prettierd", stop_after_first = true },
			typescriptreact = { "biome", "prettierd", stop_after_first = true },
			json = { "biome", "prettierd", stop_after_first = true },
			jsonc = { "biome", "prettierd", stop_after_first = true },
			css = { "prettierd", stop_after_first = true },
			html = { "prettierd", stop_after_first = true },
			yaml = { "prettierd", stop_after_first = true },
			markdown = { "prettierd", stop_after_first = true },
			graphql = { "prettierd", stop_after_first = true },
			astro = { "prettierd", stop_after_first = true },
			python = { "ruff_organize_imports", "ruff_format" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			toml = { "taplo" },
			rust = { "rustfmt" },
			go = { "gofmt" },
		},
		formatters = {
			biome = {
				command = "biome",
				args = {
					"format",
					"--stdin-file-path",
					"$FILENAME",
				},
			},
		},
	},
}
