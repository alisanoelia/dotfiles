return {
  "utilyre/barbecue.nvim",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  config = function()
     require("barbecue").setup({
      kinds = {
        File = " ",
        Module = " ",
        Namespace = " ",
        Package = " ",
        Class = " ",
        Method = " ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = " ",
        Interface = " ",
        Function = " ",
        Variable = " ",
        Constant = " ",
        String = " ",
        Number = " ",
        Boolean = " ",
        Array = " ",
        Object = " ",
        Key = " ",
        Null = " ",
        EnumMember = " ",
        Struct = " ",
        Event = "",
        Operator = " ",
        TypeParameter = " ",
      },

      symbols = {
        modified = "●",
        ellipsis = "…",
        separator = ">",
      },
    })
  end
}
