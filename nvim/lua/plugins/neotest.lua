return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'fredrikaverpil/neotest-golang',
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
    keys = {
      {
        '<leader>t',
        nil,
        desc = '[T]est Keybinds',
      },
      {
        '<leader>tt',
        function()
          require('neotest').run.run()
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
      {
        '<leader>tn',
        function()
          local neotest = require 'neotest'
          neotest.run.run { strategy = 'dap' }
          neotest.summary.open()
        end,
        desc = '[T]est, Debug, and Ope[N] summary',
      },
    },
    config = function()
      local config = {
        runner = 'gotestsum',
      }
      require('neotest').setup {
        log_level = 'info',
        adapters = {
          require 'neotest-golang'(config),
        },
      }
    end,
  },
}
