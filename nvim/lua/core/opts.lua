vim.opt.termguicolors = true
vim.opt.swapfile = false

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.lazyvim_check_order = false

-- Disable Netrw for using neo-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Configure diagnostics
vim.diagnostic.config {
  vritual_text = true,
  virtual_lines = { current_line = true },
  underline = true,
  severity_sort = true,
  update_in_insert = false,
  float = { border = 'rounded', source = 'if_many' },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
}

vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true

vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

vim.opt.splitright = true

vim.opt.splitbelow = true

vim.opt_global.tabstop = 2

vim.opt.expandtab = false

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

vim.o.foldmethod = 'expr'

vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

vim.o.foldlevel = 99

vim.o.foldlevelstart = 99

vim.o.foldenable = true

-- Sessions @auto-session options
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Clipboarding in WSL
local isWindows = vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1

if isWindows then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --clrf',
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }

  vim.opt.clipboard = 'unnamedplus'
end
