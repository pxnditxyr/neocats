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
    }

    vim.o.autoread = true

    local opencode = require("opencode")

    vim.keymap.set({ "n", "t" }, "<leader>ao", function()
      opencode.toggle()
    end, { desc = "OpenCode: Toggle" })

    vim.keymap.set({ "n", "x" }, "<leader>as", function()
      opencode.ask("@this: ", { submit = true })
    end, { desc = "OpenCode: Ask" })

    vim.keymap.set({ "n", "x" }, "<leader>at", function()
      opencode.select()
    end, { desc = "OpenCode: Execute action" })

    vim.keymap.set({ "n", "x" }, "<leader>ar", function()
      return opencode.operator("@this ")
    end, { desc = "OpenCode: Add range", expr = true })

    vim.keymap.set("n", "<leader>al", function()
      return opencode.operator("@this ") .. "_"
    end, { desc = "OpenCode: Add line", expr = true })

    vim.keymap.set("n", "<leader>au", function()
      opencode.command("session.half.page.up")
    end, { desc = "OpenCode: Scroll up" })

    vim.keymap.set("n", "<leader>ad", function()
      opencode.command("session.half.page.down")
    end, { desc = "OpenCode: Scroll down" })

    vim.keymap.set({ "n", "x" }, "<leader>ae", function()
      opencode.prompt("explain")
    end, { desc = "OpenCode: Explain" })

    vim.keymap.set({ "n", "x" }, "<leader>af", function()
      opencode.prompt("fix")
    end, { desc = "OpenCode: Fix diagnostics" })

    vim.keymap.set({ "n", "x" }, "<leader>ai", function()
      opencode.prompt("optimize")
    end, { desc = "OpenCode: Optimize" })

    vim.keymap.set({ "n", "x" }, "<leader>ac", function()
      opencode.prompt("document")
    end, { desc = "OpenCode: Document/Comment" })



    vim.api.nvim_create_autocmd("User", {
      pattern = "OpencodeEvent:*",
      callback = function(args)
        local event = args.data.event
        if event.type == "session.idle" then
          vim.notify("opencode finished", vim.log.levels.INFO)
        end
      end,
    })
  end,
}
