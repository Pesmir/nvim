return {
  {
    "folke/sidekick.nvim",
    event = "VeryLazy",
    opts = {
      -- Configure the integrated AI CLI to use a floating window
      cli = {
        win = {
          layout = "right", -- float|left|bottom|top|right
        },
        -- enable/disable tmux/zellij persistence if you use a mux
        -- mux = { backend = "zellij", enabled = false },
      },
      -- Disable Copilot status polling to avoid nagging sign-in prompts
      copilot = {
        status = {
          enabled = false,
        },
      },
    },
    keys = {
      -- Generic Sidekick CLI toggle
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle({ focus = true })
        end,
        desc = "Sidekick Toggle CLI",
        mode = { "n", "v" },
      },
      -- Directly open Codex in a floating window with current context
      {
        "<leader>ax",
        function()
          require("sidekick.cli").toggle({ name = "codex", focus = true })
        end,
        desc = "Sidekick Codex (Float)",
        mode = { "n", "v" },
      },
      -- Quickly switch focus between the CLI and editor
      {
        "<c-.>",
        function()
          require("sidekick.cli").focus()
        end,
        mode = { "n", "x", "i", "t" },
        desc = "Sidekick Switch Focus",
      },
      -- Pick a prompt preset and send it to the active tool
      {
        "<leader>ap",
        function()
          require("sidekick.cli").select_prompt()
        end,
        desc = "Sidekick Prompt Picker",
        mode = { "n", "v" },
      },
    },
  },
}
