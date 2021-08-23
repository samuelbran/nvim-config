vim.cmd('packadd packer.nvim')

return require('packer').startup(
  function()
    use 'wbthomason/packer.nvim'
    use 'rakr/vim-two-firewatch'
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
  end
)
