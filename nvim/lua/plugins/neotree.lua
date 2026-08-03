return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    priority = 999,
    lazy = false,
    keys = {
      { '\\', ':Neotree toggle<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
      source_selector = {
        winbar = true,
        statusline = false,
      },
      sources = {
        'filesystem',
        'buffers',
        'git_status',
      },
      filesystem = {
        hijack_netrw_behavior = 'open_default',
        commands = {
          image_wezterm = function(state)
            local node = state.tree:get_node()
            if node.type == 'file' then
              require('image_preview').PreviewImage(node.path)
            end
          end,
        },
      },
    },
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
}
