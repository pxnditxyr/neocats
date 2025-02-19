require( 'nixCatsUtils' ).setup({
  non_nix_value = true,
})

require( 'pxndxs.options' )
require( 'pxndxs.keymaps' )

local function getlockfilepath()
  if require( 'nixCatsUtils' ).isNixCats and type( nixCats.settings.unwrappedCfgPath ) == "string" then
    return nixCats.settings.unwrappedCfgPath .. "/lazy-lock.json"
  else
    return vim.fn.stdpath( "config" ) .. "/lazy-lock.json"
  end
end

local lazyOptions = {
  lockfile = getlockfilepath(),
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}

require( 'nixCatsUtils.lazyCat' ).setup( nixCats.pawsible({ "allPlugins", "start", "lazy.nvim" }),
  {
    require( "pxndxs.lsp" ),
    require( "pxndxs.treesitter" ),
    require( "pxndxs.file-manager" ),
    require( "pxndxs.fuzzy-finder" ),
    require( "pxndxs.completion" ),
    require( "pxndxs.git" ),
    require( "pxndxs.ai" ),
    require( "pxndxs.colorscheme" ),

    { import = 'custom.plugins' },
  },
  lazyOptions
)
