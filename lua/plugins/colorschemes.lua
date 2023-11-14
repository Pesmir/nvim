return {
  "Shatur/neovim-ayu",
  lazy = false,
  config = function()
    local cmd = vim.cmd
    local opt = vim.opt
    opt.termguicolors = true -- enable 24-bit RGB colors
    require("ayu").setup({
      mirage = true,
    })
    require("ayu").colorscheme()
  end,
}
