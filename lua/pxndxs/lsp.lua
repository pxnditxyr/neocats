return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      enabled = require( 'nixCatsUtils' ).lazyAdd( true, false ),
      config = true,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      enabled = require( 'nixCatsUtils' ).lazyAdd( true, false ),
    },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      enabled = require( 'nixCatsUtils' ).lazyAdd( true, false ),
    },

    { 'j-hui/fidget.nvim', opts = {} },

    { 'folke/lazydev.nvim', ft = "lua",
      opts = {
        library = {
          { path = ( nixCats.nixCatsPath or "" ) .. '/lua', words = { "nixCats" } },
        },
      }
    },
  },
  config = function()
    vim.api.nvim_create_autocmd( 'LspAttach', {
      group = vim.api.nvim_create_augroup( 'kickstart-lsp-attach', { clear = true } ),
      callback = function( event )
        local map = function( keys, func, desc )
          vim.keymap.set( 'n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc } )
        end

        map( '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame' )

        map( '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction' )

        map( 'K', vim.lsp.buf.hover, 'Hover Documentation' )

        map( 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration' )
        map( "gd", require("snacks").picker.lsp_definitions, "[G]oto [D]efinition" )
        map( "rl", '<cmd>LspRestart<CR>', "Restart LSP" )

        local client = vim.lsp.get_client_by_id( event.data.client_id )
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup( 'kickstart-lsp-highlight', { clear = false } )
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd( 'LspDetach', {
            group = vim.api.nvim_create_augroup( 'kickstart-lsp-detach', { clear = true } ),
            callback = function( event2 )
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          } )
        end

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map( '<leader>th', function()
            vim.lsp.inlay_hint.enable( not vim.lsp.inlay_hint.is_enabled() )
          end, '[T]oggle Inlay [H]ints' )
        end
      end,
    } )

    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require( "blink.cmp" ).get_lsp_capabilities()
    -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {}
    -- servers.clangd = {},
    -- servers.gopls = {},
    -- servers.rust_analyzer = {},
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    --
    --
    -- But for many setups, the LSP (`tsserver`) will work just fine
    -- servers.tsserver = {},
    --

    if require( 'nixCatsUtils' ).isNixCats then
      servers.nixd = {}
    else
      servers.rnix = {}
      servers.nil_ls = {}
    end
    servers.lua_ls = {
      -- cmd = {...},
      -- filetypes = { ...},
      -- capabilities = {},
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
          diagnostics = {
            globals = { "nixCats" },
            disable = { 'missing-fields' },
          },
        },
      },
    }
    servers.ts_ls = {}
    servers.pyright = {}
    servers.angularls = {}
    servers.yamlls = {}
    servers.prismals = {}
    servers.tailwindcss = {}
    servers.astro = {}

    if require( 'nixCatsUtils' ).isNixCats then
      for server_name,_ in pairs( servers ) do
        require( 'lspconfig' )[ server_name ].setup({
          capabilities = capabilities,
          settings = ( servers[ server_name ] or {} ).settings,
          filetypes = ( servers[ server_name ] or {} ).filetypes,
          cmd = ( servers[ server_name ] or {} ).cmd,
          root_pattern = ( servers[ server_name ] or {} ).root_pattern,
        })
      end
    else
      require( 'mason' ).setup()

      local ensure_installed = vim.tbl_keys( servers or {} )
      vim.list_extend( ensure_installed, {
        'stylua',
      } )
      require( 'mason-tool-installer' ).setup { ensure_installed = ensure_installed }

      require( 'mason-lspconfig' ).setup {
        handlers = {
          function( server_name )
            local server = servers[ server_name ] or {}
            server.capabilities = vim.tbl_deep_extend( 'force', {}, capabilities, server.capabilities or {} )
            require( 'lspconfig' )[ server_name ].setup( server )
          end,
        },
      }
    end
  end,
}

