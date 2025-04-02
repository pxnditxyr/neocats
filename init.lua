require( 'nixCatsUtils' ).setup({
  non_nix_value = true,
})

require( 'pxndxs.options' )
require( 'pxndxs.diagnostics' )
require( 'pxndxs.borders' )
require( 'pxndxs.keymaps' )
require( 'pxndxs.autocommands' )
require( 'pxndxs.lsp' )

local function getlockfilepath()
  if require( 'nixCatsUtils' ).isNixCats and type( nixCats.settings.unwrappedCfgPath ) == "string" then
    return nixCats.settings.unwrappedCfgPath .. "/lazy-lock.json"
  else
    return vim.fn.stdpath( "config" ) .. "/lazy-lock.json"
  end
end

local lazyOptions = {
  lockfile = getlockfilepath(),
}

require( 'nixCatsUtils.lazyCat' ).setup( nixCats.pawsible({ "allPlugins", "start", "lazy.nvim" }),
  {
    require( "pxndxs.lsp1" ),
    require( "pxndxs.treesitter" ),
    require( "pxndxs.file-manager" ),
    require( "pxndxs.completion" ),
    require( "pxndxs.git" ),
    require( "pxndxs.ai" ),
    require( "pxndxs.colorscheme" ),

    { import = 'custom.plugins' },
  },
  lazyOptions
)
