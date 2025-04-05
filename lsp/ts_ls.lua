
return {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "tsconfig.json", "package.json" },
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  single_file_support = true,
  settings = {
    tsserver = {
      preferences = {
        includeCompletionsForModuleExports = true,
        allowRenameOfImportPath = true,
      }
    }
  }
}
