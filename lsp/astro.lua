local function get_tsserver_path(root_dir)
  local node_modules = vim.fs.find('node_modules', { path = root_dir, upward = true })[ 1 ]
  if node_modules then
    local project_root = vim.fs.dirname( node_modules )
    local ts_path = vim.fs.joinpath(
      project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js'
    )
    if vim.loop.fs_stat( ts_path ) then
      return ts_path
    end
  end
  return ''
end

return {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  single_file_support = true,
  init_options = {
    typescript = {
      tsdk = get_tsserver_path( vim.fn.getcwd() ),
    }
  },
}
