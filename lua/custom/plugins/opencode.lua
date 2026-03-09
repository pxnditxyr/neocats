return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = {
    {
      "folke/snacks.nvim",
      optional = true,
      opts = function(_, opts)
        opts.input = opts.input or {}
        opts.picker = opts.picker or {}
        opts.picker.actions = opts.picker.actions or {}
        opts.picker.actions.opencode_send = function(...)
          return require("opencode").snacks_picker_send(...)
        end
        opts.picker.win = opts.picker.win or {}
        opts.picker.win.input = opts.picker.win.input or {}
        opts.picker.win.input.keys = opts.picker.win.input.keys or {}
        opts.picker.win.input.keys["<a-a>"] = { "opencode_send", mode = { "n", "i" } }
        opts.terminal = opts.terminal or {}
        return opts
      end,
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Configuración básica
      -- Para usar tu propia API key, configura la variable de entorno
      -- ANTHROPIC_API_KEY o OPENAI_API_KEY según el provider que uses
      
      -- Descomenta para habilitar el LSP experimental
      -- lsp = {
      --   enabled = true,
      -- },
      
      -- Configuración del provider (terminal integrado)
      -- provider = {
      --   type = "snacks", -- o "neovim", "kitty", "wezterm", "tmux"
      -- },
    }

    vim.o.autoread = true -- Requerido para opts.events.reload

    -- Keymaps principales - usando <leader>o como prefijo para evitar conflictos
    -- Si prefieres los keymaps originales, descomenta el bloque siguiente
    
    -- OPCIÓN 1: Keymaps con <leader>o (sin conflictos)
    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "OpenCode: Ask" })
    
    vim.keymap.set({ "n", "x" }, "<leader>ox", function()
      require("opencode").select()
    end, { desc = "OpenCode: Execute action" })
    
    vim.keymap.set({ "n", "t" }, "<leader>ot", function()
      require("opencode").toggle()
    end, { desc = "OpenCode: Toggle" })

    vim.keymap.set({ "n", "x" }, "<leader>or", function()
      return require("opencode").operator("@this ")
    end, { desc = "OpenCode: Add range", expr = true })
    
    vim.keymap.set("n", "<leader>ol", function()
      return require("opencode").operator("@this ") .. "_"
    end, { desc = "OpenCode: Add line", expr = true })

    -- Scroll en el terminal de opencode
    vim.keymap.set("n", "<leader>ou", function()
      require("opencode").command("session.half.page.up")
    end, { desc = "OpenCode: Scroll up" })
    
    vim.keymap.set("n", "<leader>od", function()
      require("opencode").command("session.half.page.down")
    end, { desc = "OpenCode: Scroll down" })

    -- Prompts rápidos
    vim.keymap.set({ "n", "x" }, "<leader>oe", function()
      require("opencode").prompt("explain")
    end, { desc = "OpenCode: Explain" })
    
    vim.keymap.set({ "n", "x" }, "<leader>of", function()
      require("opencode").prompt("fix")
    end, { desc = "OpenCode: Fix diagnostics" })
    
    vim.keymap.set({ "n", "x" }, "<leader>oo", function()
      require("opencode").prompt("optimize")
    end, { desc = "OpenCode: Optimize" })
    
    vim.keymap.set({ "n", "x" }, "<leader>oc", function()
      require("opencode").prompt("document")
    end, { desc = "OpenCode: Document/Comment" })

    --[[ OPTION 2: Original keymaps (commented by default)
    -- Uncomment this block if you don't have conflicts and prefer these shortcuts
    
    vim.keymap.set({ "n", "x" }, "<C-a>", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask opencode…" })
    
    vim.keymap.set({ "n", "x" }, "<C-x>", function()
      require("opencode").select()
    end, { desc = "Execute opencode action…" })
    
    vim.keymap.set({ "n", "t" }, "<C-.>", function()
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })

    vim.keymap.set({ "n", "x" }, "go", function()
      return require("opencode").operator("@this ")
    end, { desc = "Add range to opencode", expr = true })
    
    vim.keymap.set("n", "goo", function()
      return require("opencode").operator("@this ") .. "_"
    end, { desc = "Add line to opencode", expr = true })

    -- Restaurar funcionalidad original de <C-a> y <C-x>
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
    ]]--

    -- Opcional: Manejar eventos de opencode
    vim.api.nvim_create_autocmd("User", {
      pattern = "OpencodeEvent:*",
      callback = function(args)
        local event = args.data.event
        -- Notificación cuando opencode termina de responder
        if event.type == "session.idle" then
          vim.notify("opencode finished", vim.log.levels.INFO)
        end
      end,
    })
  end,
}
