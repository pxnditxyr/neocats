return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  keys = {
    {
      "<c-\\>",
      function()
        require( "snacks" ).terminal()
      end,
      desc = "Toggle a terminal",
      mode = { "n", "t" },
    },

    -- {
    --   "<leader>z",
    --   function()
    --     require( "snacks" ).zen()
    --   end,
    --   desc = "Toggle Zen Mode",
    -- },
    -- {
    --   "<leader>Z",
    --   function()
    --     require( "snacks" ).zen.zoom()
    --   end,
    --   desc = "Toggle Zoom",
    -- },
    --
    -- {
    --   "<leader>.",
    --   function()
    --     require( "snacks" ).scratch()
    --   end,
    --   desc = "Toggle Scratch Buffer",
    -- },
    -- {
    --   "<leader>S",
    --   function()
    --     require( "snacks" ).scratch.select()
    --   end,
    --   desc = "Select Scratch Buffer",
    -- },
    --
    -- {
    --   "<leader>n",
    --   function()
    --     require( "snacks" ).notifier.show_history()
    --   end,
    --   desc = "Notification History",
    -- },
    -- {
    --   "<leader>bd",
    --   function()
    --     require( "snacks" ).bufdelete()
    --   end,
    --   desc = "Delete Buffer",
    -- },
    -- {
    --   "<leader>cR",
    --   function()
    --     require( "snacks" ).rename.rename_file()
    --   end,
    --   desc = "Rename File",
    -- },
    --
    -- {
    --   "<leader>gB",
    --   function()
    --     require( "snacks" ).gitbrowse()
    --   end,
    --   desc = "Git Browse",
    --   mode = { "n", "v" },
    -- },
    -- {
    --   "<leader>gb",
    --   function()
    --     require( "snacks" ).git.blame_line()
    --   end,
    --   desc = "Git Blame Line",
    -- },
    -- {
    --   "<leader>gf",
    --   function()
    --     require( "snacks" ).lazygit.log_file()
    --   end,
    --   desc = "Lazygit Current File History",
    -- },
    -- {
    --   "<leader>gg",
    --   function()
    --     require( "snacks" ).lazygit()
    --   end,
    --   desc = "Lazygit",
    -- },
    -- {
    --   "<leader>gl",
    --   function()
    --     require( "snacks" ).lazygit.log()
    --   end,
    --   desc = "Lazygit Log (cwd)",
    -- },
    -- {
    --   "<leader>un",
    --   function()
    --     require( "snacks" ).notifier.hide()
    --   end,
    --   desc = "Dismiss All Notifications",
    -- },
    {
      "<leader>ff",
      function()
        require( "snacks" ).picker.smart({ multi = { "buffers", "files" } })
      end,
      desc = "Smart Picker",
    },
    -- {
    --   "<leader>pe",
    --   function()
    --     require( "snacks" ).picker.buffers()
    --   end,
    --   desc = "Buffers Picker",
    -- },
    {
      "<leader>fg",
      function()
        require( "snacks" ).picker.grep()
      end,
      desc = "Grep Picker",
    },
    -- {
    --   "<leader>ph",
    --   function()
    --     require( "snacks" ).picker.help()
    --   end,
    --   desc = "Help Picker",
    -- },
    {
      "<leader>fs",
      function()
        require( "snacks" ).picker.git_status()
      end,
      desc = "Git Status Picker",
    },
    -- {
    --   "<leader>:",
    --   function()
    --     require( "snacks" ).picker.command_history()
    --   end,
    --   desc = "Command history picker",
    -- },
  };
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
   _ (`-. ) (`-.          .-') _  _ .-') _ ) (`-.       .-')
  ( (OO  ) ( OO ).       ( OO ) )( (  OO) ) ( OO ).    ( OO ).
 _.`     \(_/.  \_)-.,--./ ,--,'  \     .'_(_/.  \_)-.(_)---\_)
(__...--'' \  `.'  / |   \ |  |\  ,`'--..._)\  `.'  / /    _ |
 |  /  | |  \     /\ |    \|  | ) |  |  \  ' \     /\ \  :` `.
 |  |_.' |   \   \ | |  .     |/  |  |   ' |  \   \ |  '..`''.)
 |  .___.'  .'    \_)|  |\    |   |  |   / : .'    \_).-._)   \
 |  |      /  .'.  \ |  | \   |   |  '--'  //  .'.  \ \       /
 `--'     '--'   '--'`--'  `--'   `-------''--'   '--' `-----'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣄⡀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠻⣿⡽⣹⣷⠆⣸⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⠟⠙⣿⡏⠀⠈⣿⡋⢾⣏⠰⢻⡃⠸⢻⣿⣿⣿⡟
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢿⣿⣷⣶⣿⣷⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠟⠛⠋⠉⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⢀⣀⣠⣶⣿⠷⣶⣤⣄⣀⣤⣶⣶⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣷⡶⠚⠋⠉⠉⠁⠀⠀⠀⠀⠈⠉⠛⢿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣶⣿⣷⣦⡀⢀⣀⣾⠃⠀⠀⠀⠀⠀⣀⣠⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣾⣿⣾⣿⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢸⣿⣿⣿⣿⠿⠛⠋⢹⡏⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⢿⣿⠟⠁⠀⠀⠀⣼⡇⠀⠀⠀⠀⣿⣿⣿⣿⣿⣛⣿⣿⣿⡇⠀⠀⠀⠀⠀⢹⣿⣿⣭⣽⣿⣿⣷⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀⠀⢻⡇⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⣠⣤⣤⡄⠉⠻⠿⠿⠿⠛⠘⣷⠀⠀⠀⠀
⠀⠀⠀⠀⢰⡏⠀⠀⠀⠀⠀⠀⠸⣧⠀⠀⠀⠀⠀⠙⠻⠿⠿⠟⠛⠁⠀⠀⠀⠀⠈⠙⠋⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀⠀⠀
⠀⣠⣤⣤⣸⡇⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣶⣦⣄⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⡁⠀⠀⠀⠀
⢸⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⡆⠀⠀⠀
⠘⢿⣿⣿⣿⣿⣷⣤⣤⣤⣤⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣁⣀⣀⣤⣤⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ]]
      }
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
