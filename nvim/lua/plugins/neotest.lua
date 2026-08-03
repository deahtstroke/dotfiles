return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      {
        'nvim-treesitter/nvim-treesitter',
        build = function()
          vim.cmd ':TSUpdate go'
        end,
      },
      {
        'fredrikaverpil/neotest-golang',
        version = '*',
        build = function()
          vim.system({ 'go', 'install', 'gotest.tools/gotestsum@latest' }):wait()
        end,
      },
    },
    config = function()
      local config = {
        runner = 'gotestsum',
      }
      require('neotest').setup {
        diagnostic = {
          enabled = false,
        },
        running = {
          concurrent = true,
        },
        output_panel = {
          enabled = false,
          open = 'botright split | resize 20',
        },
        output = {
          open_on_run = true,
        },
        adapters = {
          require 'neotest-golang'(config),
        },
      }
    end,
    keys = {
      {
        '<leader>t',
        nil,
        desc = '[T]est Keybinds',
      },
      {
        '<leader>tt',
        function()
          local neotest = require 'neotest'
          neotest.run.run()
          neotest.output.open { last_run = true }
          neotest.summary.open()
        end,
        desc = '[T]est Code under cursor',
      },
      {
        '<leader>td',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = '[T]est and [D]ebug under cursor',
      },
      {
        '<leader>ts',
        function()
          local neotest = require 'neotest'
          neotest.run.run()
          neotest.summary.open()
        end,
        desc = '[T]est and Open [S]ummary',
      },
    },
  },
}
