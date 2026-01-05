return {
  {
    "https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "go", "javascript", "typescript", "tsx", "python", "ruby", "lua" },
    opts = {
      statusline = { enabled = true },
      code_suggestions = {
        auto_filetypes = { "go", "javascript", "typescript", "tsx", "python", "ruby", "lua" },
        ghost_text = {
          enabled = false, -- follows docs: off by default, toggle with <C-h>
          toggle_enabled = "<C-h>",
          accept_suggestion = "<C-l>",
          clear_suggestions = "<C-k>",
          stream = true,
        },
      },
    },
    keys = {
      { "<C-g>", "<Plug>(GitLabToggleCodeSuggestions)", mode = "n", desc = "GitLab: Toggle Code Suggestions" },
    },
    config = function(_, opts)
      require("gitlab").setup(opts)
      vim.o.completeopt = "menu,menuone"
    end,
  },
}
