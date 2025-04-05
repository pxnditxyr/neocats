
return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  root_markers = function( fname )
    return vim.fs.dirname( vim.fs.find( ".git", { path = fname, upward = true } )[ 1 ] )
  end,
  single_file_support = true,
  settings = {
    redhat = { telemetry = { enabled = false } },
  },
}
