return {
  "glepnir/lspsaga.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },

  config = function ()

    require('lspsaga').setup{
      ui = {
        border = 'rounded',
        devicon = true,
      },
      diagnostic = {
        icons_enabled = false,
      }
    }
  end
}
