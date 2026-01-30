return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
	enabled = require("nixCatsUtils").enableForCategory("ui"),
	ft = { "markdown", "Avante" },
	opts = {
		file_types = { "markdown", "Avante" },
		-- Renderiza headings con colores y tamaños diferentes
		heading = {
			enabled = true,
			sign = true,
			position = "overlay",
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
			backgrounds = {
				"RenderMarkdownH1Bg",
				"RenderMarkdownH2Bg",
				"RenderMarkdownH3Bg",
				"RenderMarkdownH4Bg",
				"RenderMarkdownH5Bg",
				"RenderMarkdownH6Bg",
			},
			foregrounds = {
				"RenderMarkdownH1",
				"RenderMarkdownH2",
				"RenderMarkdownH3",
				"RenderMarkdownH4",
				"RenderMarkdownH5",
				"RenderMarkdownH6",
			},
		},
		-- Code blocks con highlights
		code = {
			enabled = true,
			sign = true,
			style = "full",
			position = "left",
			width = "full",
			left_pad = 0,
			right_pad = 0,
		},
		-- Bullets bonitos
		bullet = {
			enabled = true,
			icons = { "●", "○", "◆", "◇" },
		},
		-- Checkboxes renderizados
		checkbox = {
			enabled = true,
			unchecked = {
				icon = "󰄱 ",
			},
			checked = {
				icon = "󰱒 ",
			},
		},
		-- Links renderizados
		link = {
			enabled = true,
			image = "󰥶 ",
			hyperlink = "󰌹 ",
			highlight = "RenderMarkdownLink",
		},
		-- Pipe tables renderizadas
		pipe_table = {
			enabled = true,
			preset = "round",
			style = "full",
		},
	},
	config = function(_, opts)
		require("render-markdown").setup(opts)

		-- Toggle para render-markdown
		vim.keymap.set("n", "<leader>tm", ":RenderMarkdown toggle<CR>", { desc = "Toggle Render Markdown" })
	end,
}
