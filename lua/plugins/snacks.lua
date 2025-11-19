return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}
      local projects = opts.picker.sources.projects or {}
      opts.picker.sources.projects = projects

      local dev = projects.dev
      if type(dev) == "string" then
        dev = { dev }
      elseif type(dev) == "table" then
        dev = vim.list_extend({}, dev)
      else
        dev = { "~/dev", "~/projects" }
      end
      projects.dev = dev

      local normalize = vim.fs.normalize
      local target = normalize("~/smaXtec")
      local found = false
      for _, dir in ipairs(dev) do
        if normalize(dir) == target then
          found = true
          break
        end
      end
      if not found then
        table.insert(dev, target)
      end
    end,
  },
}
