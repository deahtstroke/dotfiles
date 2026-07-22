return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      image = { enabled = false },
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
      },
      cursor = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        sources = {
          explorer = {},
        },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      terminal = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      {
        '<leader>sn',
        function()
          require('snacks').picker.notifications {
            matcher = {
              frecency = true,
            },
            ui_select = true,
          }
        end,
      },
      {
        '<leader><space>',
        function()
          require('snacks').picker.smart {
            matcher = {
              frecency = true,
            },
            ui_select = true,
          }
        end,
        desc = 'Smart Find Files',
      },
      {
        '<leader>sb',
        function()
          require('snacks').picker.buffers()
        end,
        desc = '[S]earch [B]uffers',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep {
            dirs = { vim.fn.getcwd() },
            on_show = function()
              vim.cmd.stopinsert()
            end,
            layout = 'dropdown',
          }
        end,
        desc = '[S]earch [G]rep',
      },
      {
        '<leader>sr',
        function()
          Snacks.picker.recent {}
        end,
        desc = '[S]earch [R]ecent',
      },
      {
        '<leader>gN',
        function()
          require('snacks').picker.notifications()
        end,
        desc = '[G]oto [N]otifications',
      },
      -- LSP functionalities
      {
        'gd',
        function()
          require('snacks').picker.lsp_definitions()
        end,
        desc = '[G]oto [D]efinition',
      },
      {
        'grD',
        function()
          require('snacks').picker.lsp_declarations()
        end,
        desc = '[G]oto [D]eclarations',
      },
      {
        'grr',
        function()
          require('snacks').picker.lsp_references()
        end,
        desc = '[G]oto [R]eferences',
      },
      {
        'gri',
        function()
          require('snacks').picker.lsp_implementations()
        end,
        desc = '[G]oto [I]mplementations',
      },

      -- Git
      {
        '<leader>gb',
        function()
          require('snacks').picker.git_branches()
        end,
        desc = '[G]it [B]ranches',
      },
      {
        '<leader>gl',
        function()
          require('snacks').picker.git_log()
        end,
        desc = '[G]it [L]og',
      },
      {
        '<leader>gs',
        function()
          require('snacks').picker.git_status()
        end,
        desc = '[G]it [S]tatus',
      },
    },
  },
}
