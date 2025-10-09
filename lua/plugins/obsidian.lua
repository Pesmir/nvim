return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
      "BufReadPre *.md",
      "BufNewFile *.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
    },
    opts = function()
      return {
        workspaces = {
          {
            name = "Personal",
            path = vim.fn.expand("~/smaXtec/Notes/"),
          },
        },
        notes_subdir = "00_Inbox",
        daily_notes = {
          folder = "10_Daily",
        },
        completion = {
          nvim_cmp = true,
        },
        templates = {
          folder = "90_Templates",
        },
      }
    end,
  },
}
