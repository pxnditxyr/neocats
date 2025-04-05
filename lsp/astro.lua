return {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_markers = { "astro.config.mjs" },
  single_file_support = true,
  init_options = {
    typescript = {
      tsdk = "node_modules/typescript/lib",
    }
  },
  before_init = function( params )
    print( params )
  end
}
