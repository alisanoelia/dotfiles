return {
  "glepnir/lspsaga.nvim",

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
