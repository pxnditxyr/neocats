return {
  "yetone/avante.nvim",
  version = false,
  enabled = require( "nixCatsUtils" ).enableForCategory( "ai" ),
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>ag",
      ":AvanteAsk<CR>",
      desc = "Avante Ask",
    },
  },
  opts = vim.tbl_extend( "force", {
    provider = "copilot",
    selector = {
      provider = "snacks",
    },
    system_prompt = function()
      local hub = require( "mcphub" ).get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
    end,
    custom_tools = function()
      return {
        require( "mcphub.extensions.avante" ).mcp_tool(),
      }
    end,
    disabled_tools = {},
  }, require( "nixCatsUtils" ).getCatOrDefault( "avanteOpts", {} ) or {} ),
  init = function()
    if require( "nixCatsUtils" ).getCatOrDefault( "avanteOpts.load_env_keys" ) then
      local key = vim.trim( vim.system({ "rbw", "get", "delorean" }):wait().stdout )
      vim.fn.setenv( "OPENAI_API_KEY", key )
      vim.fn.setenv( "ANTHROPIC_API_KEY", key )
    end
  end,
}
