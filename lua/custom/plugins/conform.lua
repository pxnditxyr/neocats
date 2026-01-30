return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			nix = { "nixfmt" },
			-- JS/TS: Usar Biome primero, fallback a prettierd
			javascript = { "biome", "prettierd", stop_after_first = true },
			typescript = { "biome", "prettierd", stop_after_first = true },
			javascriptreact = { "biome", "prettierd", stop_after_first = true },
			typescriptreact = { "biome", "prettierd", stop_after_first = true },
			json = { "biome", "prettierd", stop_after_first = true },
			jsonc = { "biome", "prettierd", stop_after_first = true },
			-- CSS/HTML: Prettier
			css = { "prettierd", stop_after_first = true },
			html = { "prettierd", stop_after_first = true },
			yaml = { "prettierd", stop_after_first = true },
			markdown = { "prettierd", stop_after_first = true },
			graphql = { "prettierd", stop_after_first = true },
			astro = { "prettierd", stop_after_first = true },
			-- Python: Usar Ruff
			python = { "ruff_organize_imports", "ruff_format" },
			-- Shell scripts
			sh = { "shfmt" },
			bash = { "shfmt" },
			-- TOML: Usar Taplo
			toml = { "taplo" },
			-- Rust: rustfmt
			rust = { "rustfmt" },
			-- Go: gofmt
			go = { "gofmt" },
		},
		-- Configuración personalizada de formatters
		formatters = {
			biome = {
				-- Biome usa configuración de biome.json o usa defaults
				-- NO pasamos argumentos aquí, los configuramos con biome.json en cada proyecto
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
