return {
  {
    "williamboman/mason.nvim",
    lazy = false, -- Ensure it loads on startup
    config = function()
      local mason = require("mason")
      local mason_registry = require("mason-registry")

      mason.setup() -- Initialize Mason

      -- Read package names from file and install them if missing
      local packages_file = os.getenv("HOME") .. "/.config/nvim/mason-packages.txt"
      local packages = {}

      -- Ensure file exists before reading
      local file = io.open(packages_file, "r")
      if file then
        for line in file:lines() do
          table.insert(packages, line)
        end
        file:close()
      end

      -- Install missing packages
      for _, package in ipairs(packages) do
        local p = mason_registry.get_package(package)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false, -- Load with Mason
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {}, -- Let Mason handle installations
        automatic_installation = false, -- Disable auto-installing missing LSPs here (we handle it manually)
      })
    end,
  },
}
