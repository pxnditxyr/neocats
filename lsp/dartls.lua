
return {
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    outline = true,
    flutterOutline = true,
  },
  root_markers = { "pubspec.yaml" },
  single_file_support = true,
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    }
  },
}
