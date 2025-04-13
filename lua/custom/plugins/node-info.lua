vim.treesitter.query.set(
      "json",
      "node_dependencies",
      [[
        (pair
          key: (string
            (string_content) @key (#match? @key "dependencies|devDependencies")
          )
          value: (object
            (pair
              key: (string (string_content) @depen)
              )
            )
          )
        ]]
    )
    local group = vim.api.nvim_create_augroup( "node-info", {} )

    vim.api.nvim_create_autocmd( { "BufEnter", "BufWritePost" }, {
      pattern = "package.json",
      group = group,
      callback = function( event )
        local parser = vim.treesitter.get_parser( event.buf, "json" )
        local tree = parser:parse()[ 1 ]
        if tree == nil then
          return
        end

        local query = vim.treesitter.query.get( "json", "node_dependencies" )

        if not query then
          return
        end

        local dependencies = {}

        for id, node in query:iter_captures( tree:root(), event.buf ) do
          if query.captures[ id ] == "depen" then
            table.insert( dependencies, {
              name = vim.treesitter.get_node_text( node, event.buf ),
              line = node:start(),
            } )
          end
        end

        if #dependencies == 0 then
          return
        end

        local namespace = vim.api.nvim_create_namespace( "node-deps" )
        vim.api.nvim_buf_clear_namespace( event.buf, namespace, 0, -1 )

        vim.system(
          { "npm", "list", "--json", "--depth=0" },
          {},
          vim.schedule_wrap( function( out )
            if out.code ~= 0 then
              return
            end

            local success, data = pcall( vim.json.decode, out.stdout, {} )
            if not success then
              return
            end

            if not data.dependencies then
              return
            end

            for _, dep in ipairs( dependencies ) do
              local info = data.dependencies[ dep.name ]
              if info then
                vim.api.nvim_buf_set_extmark( event.buf, namespace, dep.line, 0, {
                  virt_text = { { string.format( ' ⚡ %s', info.version ), "Comment" } },
                  virt_text_pos = "eol",
                } )
              end
            end
          end )
        )

        vim.system(
          { "npm", "outdated", "--json" },
          {},
          vim.schedule_wrap( function( out )
            if out.code ~= 0 and out.code ~= 1 then
              return
            end

            local success, data = pcall( vim.json.decode, out.stdout, {} )
            if not success then
              return
            end

            if not data or vim.tbl_isempty( data ) then
              return
            end

            for _, dep in ipairs( dependencies ) do
              local info = data[ dep.name ]
              if info then
                if string.find( info.current, "-" ) then
                  vim.api.nvim_buf_set_extmark( event.buf, namespace, dep.line, 0, {
                    virt_text = { { string.format( '⚠️🔄 %s (unstable beta)', info.current ), "WarningMsg" } },
                    virt_text_pos = "eol",
                  } )
                else
                  vim.api.nvim_buf_set_extmark( event.buf, namespace, dep.line, 0, {
                    virt_text = { { string.format( '🚀👆 %s (new version)', info.latest ), "Error" } },
                    virt_text_pos = "eol",
                  } )
                end

              end
            end
          end )
        )
      end,
    } )
