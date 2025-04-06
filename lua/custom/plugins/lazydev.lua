return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      { path = (require("nixCats").nixCatsPath or "") .. "/lua", words = { "nixCats" } },
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "${3rd}/love2d/library", words = { "love" } },
      "nvim-dap-ui",
    },
  },
}
