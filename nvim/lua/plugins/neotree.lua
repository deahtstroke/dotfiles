return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'folke/snacks.nvim',
      'MunifTanjim/nui.nvim',
    },
    init = function()
      vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
        desc = 'Start Neo-tree with directory',
        once = true,
        callback = function()
          if package.loaded['neo-tree'] then
            return
          else
            local stats = vim.uv.fs_stat(vim.fn.argv(0))
            if stats and stats.type == 'directory' then
              require 'neo-tree'
            end
          end
        end,
      })
    end,
    cmd = 'Neotree',
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
