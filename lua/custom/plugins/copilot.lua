return {
  {
    "zbirenbaum/copilot.lua",
    enabled = require( "nixCatsUtils" ).enableForCategory( "ai" ),
    opts = {
      panel = { enabled = false },
      suggestion = { enabled = false },
    },
  },
}
