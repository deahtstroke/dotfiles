for _, source in ipairs { 'core.opts', 'core.keymaps', 'core.autocmds' } do
  local ok, err = pcall(require, source)
  if not ok then
    vim.notify('Error loading ' .. source .. '\n\n' .. err, vim.log.levels.ERROR)
  end
end

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'rebelot/kanagawa.nvim',
    opts = {
      undercurl = false,
      background = {
        dark = 'wave',
        light = 'lotus',
      },
    },
  },
  { import = 'plugins' },
}, {
  checker = {
    enabled = true,
    notify = true,
    frequency = 3600,
  },
  auto_install = true,
})

local ok, _ = pcall(vim.cmd, 'colorscheme kanagawa')
if not ok then
  vim.cmd.colorscheme 'kanagawa'
end
