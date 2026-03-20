return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_python = require("dap-python")

    dap_python.setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

    dapui.setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.after.event_initialized.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    vim.keymap.set("n", "<Leader>dc", function()
      dap.continue()
    end)
    vim.keymap.set("n", "<Leader>dso", function()
      dap.step_over()
    end)
    vim.keymap.set("n", "<Leader>dsi", function()
      dap.step_into()
    end)
    vim.keymap.set("n", "<Leader>dsr", function()
      dap.step_out()
    end)
    vim.keymap.set("n", "<Leader>dbt", function()
      dap.toggle_breakpoint()
    end)
    vim.keymap.set("n", "<Leader>dbs", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))
    end)
    vim.keymap.set("n", "<Leader>dlp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end)
    vim.keymap.set("n", "<Leader>dr", function()
      dap.repl.open()
    end)
    vim.keymap.set("n", "<Leader>dl", function()
      dap.run_last()
    end)
    vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
      require("dap.ui.widgets").hover()
    end)
    vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
      require("dap.ui.widgets").preview()
    end)
    vim.keymap.set("n", "<Leader>df", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set("n", "<Leader>ds", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end)

    -- Go DAB
    dap.adapters.delve = function(callback, config)
      if config.mode == "remote" and config.request == "attach" then
        callback({
          type = "server",
          host = config.host or "127.0.0.1",
          port = config.port or "38697",
        })
      else
        callback({
          type = "server",
          port = "${port}",
          executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
            detached = vim.fn.has("win32") == 0,
          },
        })
      end
    end

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
      {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      -- works with go.mod packages and sub packages
      {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Debug file",
        program = "${file}",
        pythonPath = dap_python.resolve,
      },
      {
        type = "python",
        request = "launch",
        name = "Debug current file (pytest)",
        module = "pytest",
        args = { "${file}" },
        pythonPath = dap_python.resolve,
      },
      {
        type = "python",
        request = "launch",
        name = "Debug current file (no config)",
        module = "debugpy",
        args = { "${file}" },
        pythonPath = dap_python.resolve,
      },
    }

    dap.adapters.dart = {
      type = "executable",
      command = "dart",
      args = { "debug_adapter" },
    }
    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Dart: Launch current file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "dart",
        request = "launch",
        name = "Flutter: Launch app",
        program = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
      },
    }

    local bash_debug_path = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter"
    dap.adapters.bashdb = {
      type = "executable",
      command = bash_debug_path .. "/bash-debug-adapter",
    }
    dap.configurations.sh = {
      {
        type = "bashdb",
        request = "launch",
        name = "Launch file",
        showDebugOutput = true,
        pathBashdb = bash_debug_path .. "/bashdb_dir/bashdb",
        pathBashdbLib = bash_debug_path .. "/bashdb_dir",
        trace = true,
        file = "${file}",
        program = "${file}",
        cwd = "${workspaceFolder}",
        pathCat = "cat",
        pathBash = "/bin/bash",
        pathMkfifo = "mkfifo",
        pathPkill = "pkill",
        args = {},
        env = {},
        terminalKind = "integrated",
      },
    }
  end,
}
