return {
  { "folke/tokyonight.nvim" },
  {
    "tanvirtin/monokai.nvim",

    config = function()
      require("monokai").setup {
        palette = require("monokai").pro,
	italics = false
    }
    end
  },
  {
    "EdenEast/nightfox.nvim",

    config = function()
      require('nightfox').setup({
	-- remove italics
	groups = {
          all = {
            Keyword = { style = "NONE" },
	    ["@keyword"] = { style = "NONE" },
	    ["@conditional"] = { style = "NONE" },
	    ["@repeat"] = { style = "NONE" },
	  },
	},
    })
    end,
  },
}
