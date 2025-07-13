return {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  single_file_support = true,
  init_options = {
    typescript = {
      tsdk = "node_modules/typescript/lib"
    }
  },
}
