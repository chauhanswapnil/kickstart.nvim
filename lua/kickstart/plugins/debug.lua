-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

-- return {
--   -- NOTE: Yes, you can install new plugins here!
--   'mfussenegger/nvim-dap',
--   'mfussenegger/nvim-dap-python',
--   -- NOTE: And you can specify dependencies as well
--   dependencies = {
--     -- Creates a beautiful debugger UI
--     'rcarriga/nvim-dap-ui',
--
--     -- Installs the debug adapters for you
--     'williamboman/mason.nvim',
--     'jay-babu/mason-nvim-dap.nvim',
--
--     -- Add your own debuggers here
--     'leoluz/nvim-dap-go',
--   },
--   config = function()
--     local dap = require 'dap'
--     local dapui = require 'dapui'
--
--     local path = require('mason-registry').get_package('debugpy'):get_install_path()
--     local dappy = require('dap-python')
--     dappy.setup '~/.config/virtualenv-nvim/debugpy/bin/python'
--     require('mason-nvim-dap').setup {
--       -- Makes a best effort to setup the various debuggers with
--       -- reasonable debug configurations
--       automatic_setup = true,
--
--       -- You can provide additional configuration to the handlers,
--       -- see mason-nvim-dap README for more information
--       handlers = {},
--
--       -- You'll need to check that you have the required things installed
--       -- online, please don't ask me how to install them :)
--       ensure_installed = {
--         -- Update this to ensure that you have the debuggers for the langs you want
--         'delve',
--       },
--     }
--
--     require('nvim-dap-python').setup {
--       dappy.setup(path .. '/venv/bin/python'),
--     }
--     vim.keymap.set('n', '<leader>ct', dappy.test, { desc = 'Debug: Start/Continue' })
--     vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
--     vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
--     vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
--     vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
--     vim.keymap.set('n', '<leader>B', function()
--
--     -- Basic debugging keymaps, feel free to change to your liking!
--     vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
--     vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
--     vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
--     vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
--     vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
--     vim.keymap.set('n', '<leader>B', function()
--       dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
--     end, { desc = 'Debug: Set Breakpoint' })
--
--     -- Dap UI setup
--     -- For more information, see |:help nvim-dap-ui|
--     dapui.setup {
--       -- Set icons to characters that are more likely to work in every terminal.
--       --    Feel free to remove or use ones that you like more! :)
--       --    Don't feel like these are good choices.
--       icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
--       controls = {
--         icons = {
--           pause = '⏸',
--           play = '▶',
--           step_into = '⏎',
--           step_over = '⏭',
--           step_out = '⏮',
--           step_back = 'b',
--           run_last = '▶▶',
--           terminate = '⏹',
--           disconnect = '⏏',
--         },
--       },
--     }
--
--     -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
--     vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
--
--     dap.listeners.after.event_initialized['dapui_config'] = dapui.open
--     dap.listeners.before.event_terminated['dapui_config'] = dapui.close
--     dap.listeners.before.event_exited['dapui_config'] = dapui.close
--
--     -- Install golang specific config
--     require('dap-go').setup()
--   end,
-- }
--

return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      -- vim.keymap.set('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>')
      -- vim.keymap.set('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>')
      -- vim.keymap.set('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>')
      -- vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".continue()<CR>')
      -- vim.keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
      -- vim.keymap.set('n', '<leader>dc', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
      --
      -- vim.keymap.set('n', '<leader>du', '<cmd>lua require"dapui".toggle()<CR>')

      vim.keymap.set('n', '<leader>dt', "<cmd>lua require 'dap'.toggle_breakpoint()<cr>", { desc = 'Toggle Breakpoint' })

      vim.keymap.set('n', '<leader>db', "<cmd>lua require'dap'.step_back()<cr>", { desc = 'Step Back' })
      vim.keymap.set('n', '<leader>dc', "<cmd>lua require'dap'.continue()<cr>", { desc = 'Continue' })
      vim.keymap.set('n', '<leader>dC', "<cmd>lua require'dap'.run_to_cursor()<cr>", { desc = 'Run To Cursor' })
      vim.keymap.set('n', '<leader>dd', "<cmd>lua require'dap'.disconnect()<cr>", { desc = 'Disconnect' })
      vim.keymap.set('n', '<leader>dg', "<cmd>lua require'dap'.session()<cr>", { desc = 'Get Session' })
      vim.keymap.set('n', '<leader>di', "<cmd>lua require'dap'.step_into()<cr>", { desc = 'Step Into' })
      vim.keymap.set('n', '<leader>do', "<cmd>lua require'dap'.step_over()<cr>", { desc = 'Step Over' })
      vim.keymap.set('n', '<leader>du', "<cmd>lua require'dap'.step_out()<cr>", { desc = 'Step Out' })
      vim.keymap.set('n', '<leader>dp', "<cmd>lua require'dap'.pause()<cr>", { desc = 'Pause' })
      vim.keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = 'Toggle Repl' })
      vim.keymap.set('n', '<leader>ds', "<cmd>lua require'dap'.continue()<cr>", { desc = 'Start' })
      vim.keymap.set('n', '<leader>dq', "<cmd>lua require'dap'.close()<cr>", { desc = 'Quit' })
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup {
        expand_lines = true,
        icons = { expanded = '', collapsed = '', circular = '' },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          edit = 'e',
          repl = 'r',
          toggle = 't',
        },
        layouts = {
          {
            elements = {
              -- { id = 'console', size = 0.55 },
              { id = 'scopes', size = 0.33 },
              { id = 'breakpoints', size = 0.17 },
              { id = 'stacks', size = 0.25 },
              { id = 'watches', size = 0.25 },
            },
            size = 0.33,
            position = 'right',
          },
          {
            elements = {
              { id = 'repl', size = 0.45 },
              { id = 'console', size = 0.55 },
            },
            size = 0.27,
            position = 'bottom',
          },
        },
        floating = {
          max_height = 0.9,
          max_width = 0.5, -- Floats will be treated as percentage of your screen.
          border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
          mappings = {
            close = { 'q', '<Esc>' },
          },
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end

      -- dap.listeners.before.event_terminated['dapui_config'] = function()
      --   dapui.close()
      -- end
      --
      -- dap.listeners.before.event_exited['dapui_config'] = function()
      --   dapui.close()
      -- end

      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
      vim.keymap.set('n', '<leader>dU', "<cmd>lua require'dapui'.toggle({reset = true})<cr>", { desc = 'Toggle UI' })
    end,
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('mason-nvim-dap').setup {
        automatic_installation = true,
        ensure_installed = { 'python' },
      }
    end,
  },

  {
    'mfussenegger/nvim-dap-python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    ft = { 'python' },
    config = function()
      require('dap-python').setup '~/.config/virtualenv-nvim/debugpy/bin/python'
      require('dap-python').resolve_python = function()
        return os.getenv 'PYENV_VIRTUAL_ENV'
      end
      require('dap-python').test_runner = 'pytest'

      vim.keymap.set('n', '<leader>pt', "<cmd>lua require('dap-python').test_method()<cr>", { desc = '[P]ython [Test] Method' })
      vim.keymap.set('n', '<leader>pc', "<cmd>lua require('dap-python').test_class()<cr>", { desc = '[P]ython [Test] Class' })
      vim.keymap.set('n', '<leader>ps', "<cmd><ESC>:lua require('dap-python').debug_selection()<cr>", { desc = '[P]ython Debug [S]election' })
    end,
  },
}
