return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'file-manager' ),
  -- cmd = { "Oil" },
  lazy = false,
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
      is_hidden_file = function( name, bufnr )
        local m = name:match("^%.")
        return m ~= nil
      end,
      is_always_hidden = function( name, bufnr )
        local names = {
          ".git",
          "node_modules",
          "__pycache__",
          "coverage",
          "bun.lockb",
          "bun.lock",
          "yarn.lock",
          "package-lock.json",
          "pnpm-lock.yaml",
          "postgres",
          "mysql",
          "sqlite",
          "mongo",
          ".direnv",
          "postgres-db",
          "dist",
          "redis-data",
          "target",
        }
        local root_path = vim.fn.getcwd()
        local files_path = vim.fn.expand( "%" )
        local new_path = ""
        if type( files_path ) == "table" then
          for _, path in ipairs( files_path ) do
            new_path = new_path .. path
          end
        else
          new_path = files_path
        end
        local new_file_path = string.sub( new_path, 7 )
        if new_file_path == root_path .. '/' then
          return vim.tbl_contains( names, name )
        end
        return false
      end,
      natural_order = "fast",
      case_insensitive = false,
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
      highlight_filename = function( entry, is_hidden, is_link_target, is_link_orphan )
        return nil
      end,
    },
  },
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Open Oil" },
  }
}
