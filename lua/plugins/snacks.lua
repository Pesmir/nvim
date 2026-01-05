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

      -- increase search depth so that all repos
      -- under ~/smaXtec are picked up recursively
      projects.max_depth = projects.max_depth or 10

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

      -- Confirming a project should cd into it and immediately open the files picker
      projects.confirm = { "tcd", "picker_files" }

      -- Only treat directories that contain a .git folder as projects
      projects.patterns = { ".git" }
      local uv = vim.uv or vim.loop
      projects.filter = {
        filter = function(item)
          local dir = item.file or item.text
          if not dir then
            return false
          end
          -- normalize and avoid trailing slash before appending /.git
          dir = normalize(dir):gsub("/+$", "")
          return uv.fs_stat(dir .. "/.git") ~= nil
        end,
      }
    end,
  },
}
