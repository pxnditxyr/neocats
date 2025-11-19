return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 1000,  -- Delay de 1 segundo antes de mostrar which-key (no molesta)
    spec = {
      { "<leader>f", group = "find" },
      { "<leader>d", group = "debug/diagnostics" },
      { "<leader>g", group = "git" },
      { "<leader>q", group = "quit/session" },
      { "<leader>s", group = "split" },
      { "<leader>t", group = "toggle/tab" },
      { "<leader>x", group = "trouble" },
      { "<leader>a", group = "ai" },
      { "<leader>r", group = "rename/refactor" },
      { "gs", group = "surround" },
      { "[", group = "prev" },
      { "]", group = "next" },
    },
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
