require('plugins')
require('opts')

vim.cmd('colo two-firewatch')

local config = {
  options = {theme = 'horizon'}
}

require('lualine').setup(config)
