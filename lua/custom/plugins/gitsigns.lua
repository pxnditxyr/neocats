return {
	"lewis6991/gitsigns.nvim",
	enabled = require("nixCatsUtils").enableForCategory("git"),
	opts = {
		signs = {
			add = { text = "󱝹" },
			change = { text = "" },
			delete = { text = "󱂧" },
			topdelete = { text = "✎" },
			changedelete = { text = "" },
			untracked = { text = "❓" },
		},
		signs_staged = {
			add = { text = "✚" },
			change = { text = "🖌️" },
			delete = { text = "✖" },
			topdelete = { text = "⌃" },
			changedelete = { text = "✌" },
			untracked = { text = "❓" },
		},
		signs_staged_enable = true,
		signcolumn = true,
		numhl = false,
		linehl = false,
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]g", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]g", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Next Git [G]hunk" })

			map("n", "[g", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[g", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Prev Git [G]hunk" })

			-- Actions
			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Git [S]tage hunk" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git [R]eset hunk" })
			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git [S]tage hunk" })
			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git [R]eset hunk" })
			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Git [S]tage buffer" })
			map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Git [U]ndo stage hunk" })
			map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Git [R]eset buffer" })
			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git [P]review hunk" })
			map("n", "<leader>gl", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Git [L]ine blame" })
			map("n", "<leader>gd", gitsigns.diffthis, { desc = "Git [D]iff against index" })
			map("n", "<leader>gD", function()
				gitsigns.diffthis("~")
			end, { desc = "Git [D]iff against last commit" })

			-- Toggles
			map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Git [B]lame line" })
			map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle Git [D]eleted" })
		end,
	},
}
