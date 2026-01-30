return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		init = function()
			vim.g.no_plugin_maps = true
		end,
		after = function(plugin)
			---@param buf integer
			---@param language string
			---@return boolean
			local function treesitter_try_attach(buf, language)
				if not vim.treesitter.language.add(language) then
					return false
				end
				vim.treesitter.start(buf, language)

				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
				vim.o.foldlevel = 99

				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				return true
			end

			local installable_parsers = require("nvim-treesitter").get_available()

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local buf, filetype = args.buf, args.match
					local language = vim.treesitter.language.get_lang(filetype)
					if not language then
						return
					end

					if not treesitter_try_attach(buf, language) then
						if vim.tbl_contains(installable_parsers, language) then
							require("nvim-treesitter").install(language):await(function()
								treesitter_try_attach(buf, language)
							end)
						end
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = false,
		after = function(plugin)
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
					selection_modes = {
						["@function.outer"] = "af",
						["@function.inner"] = "if",
						["@class.outer"] = "ac",
						["@class.inner"] = "ic",
						["@block.outer"] = "ab",
						["@block.inner"] = "ib",
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPost",
		opts = {
			enable = true,
		},
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPost",
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
			-- per_filetype = {
			--   ["html"] = {
			--     enable_close = false
			--   }
			-- }
		},
		config = function(_, opts)
			require("nvim-ts-autotag").setup(opts)
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "BufReadPost",
		init = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			---@type rainbow_delimiters.config
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = "rainbow-delimiters.strategy.global",
					vim = "rainbow-delimiters.strategy.local",
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				priority = {
					[""] = 110,
					lua = 210,
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
			vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#ff2442" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#73ff00" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#00ff9d" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#e28400" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#06D001" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#bbff00" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#ff00ff" })
			-- local test = (((((((())))))))
		end,
	},
}
