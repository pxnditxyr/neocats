vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float( nil, { focus = false } )]]

local border = {
  { "🭽", "LspFloatWinBorder" },
  { "▔", "LspFloatWinBorder" },
  { "🭾", "LspFloatWinBorder" },
  { "▕", "LspFloatWinBorder" },
  { "🭿", "LspFloatWinBorder" },
  { "▁", "LspFloatWinBorder" },
  { "🭼", "LspFloatWinBorder" },
  { "▏", "LspFloatWinBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview( contents, syntax, opts, ... )
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview( contents, syntax, opts, ... )
end
