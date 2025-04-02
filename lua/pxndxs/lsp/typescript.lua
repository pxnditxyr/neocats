vim.lsp.config.typescript = {
  cmd = { 'typescript-language-server', '--stdio' },
  root_markers = { 'tsconfig.json', 'package.json' },
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
  settings = {
    tsserver = {
      preferences = {
        includeCompletionsForModuleExports = true,
        allowRenameOfImportPath = true,
      }
    }
  }
}
