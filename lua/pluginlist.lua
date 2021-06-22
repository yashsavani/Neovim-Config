local packer = require("packer")
local use = packer.use

packer.init({
    display = {
        open_cmd = "leftabove 80vnew [packer]",
    },
    profile = {
        enable = true,
        threshold = 1,
    },
})

return packer.startup(
  function()
    -- Packer can manage itself.
    use "wbthomason/packer.nvim"

    -- Themes
    use "navarasu/onedark.nvim"
    use "sainnhe/gruvbox-material"
    use "rafamadriz/neon"

    -- Tree-Sitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      requires = {
        "windwp/nvim-ts-autotag",
        "andymass/vim-matchup",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "p00f/nvim-ts-rainbow",
      }
    })

    -- Language Server
    use ({
      "neovim/nvim-lspconfig",
      requires = { "kabouzeid/nvim-lspinstall", "glepnir/lspsaga.nvim" }
    })
    use {
      "ahmedkhalf/lsp-rooter.nvim",
      config = function()
        require("lsp-rooter").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- Autocomplete
    use {
      "hrsh7th/nvim-compe",
      requires = { "hrsh7th/vim-vsnip" }
    }


    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-media-files.nvim",
        "nvim-telescope/telescope-project.nvim",
      },
    })

    -- Explorer
    use({
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" }
    })

    -- Git
    use({
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" }
    })
    use({
      "TimUntersberger/neogit",
      requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" }
    })

    -- Miscellaneous
    use "terrortylor/nvim-comment" 
    use "windwp/nvim-autopairs"
    use "karb94/neoscroll.nvim"
    use "folke/which-key.nvim"
    use "machakann/vim-sandwich"
    use "ggandor/lightspeed.nvim"
    use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
    use "glepnir/dashboard-nvim"
    use {"RRethy/vim-hexokinase", run = "make hexokinase"}
    use "RRethy/vim-illuminate"
    use { "lewis6991/spellsitter.nvim", config = function() require('spellsitter').setup() end}

    -- Statuslines
    use({
      "glepnir/galaxyline.nvim",
      branch = "main",
      requires = { "kyazdani42/nvim-web-devicons" }
    })
    use({
      "romgrk/barbar.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })

  end,
  {
    display = {
      border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
  }
)
