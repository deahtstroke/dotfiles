return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ts = require 'nvim-treesitter'

      local parsers = {
        'lua',
        'vim',
        'vimdoc',
        'query',
        'markdown',
        'markdown_inline',
        'go',
        'java',
        'c',
        'javascript',
        'typescript',
      }

      ts.install(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = '*',
        callback = function()
          local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
          if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start()
          end
        end,
      })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = '*',
        callback = function()
          vim.wo.foldmethod = 'expr'
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end,
      })
    end,
  },
}
