vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Vimtex
  use 'lervag/vimtex'

  -- Ultisnips
  use "SirVer/ultisnips"

  -- goose.vim
  use "hgoose/goose.vim"

  -- color scheme  
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Mason
  use {
	  "williamboman/mason.nvim"
  }
  -- Whichkey
  use {
	  "folke/which-key.nvim",
	  config = function()
		  vim.o.timeout = true
		  vim.o.timeoutlen = 300
		  require("which-key").setup {
			-- 
		  }
	  end
  }
  -- For auto saving in vim
  use "907th/vim-auto-save"

  use {
    "Darazaki/indent-o-matic",

    require('indent-o-matic').setup {
      -- The values indicated here are the defaults

      -- Number of lines without indentation before giving up (use -1 for infinite)
      max_lines = 2048,

      -- Space indentations that should be detected
      standard_widths = { 2, 4, 8 },

      -- Skip multi-line comments and strings (more accurate detection but less performant)
      skip_multiline = true,
    }
}

-- status bar
use {'vim-airline/vim-airline'}
use {'vim-airline/vim-airline-themes'}

-- Treesitter
use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  require('nvim-treesitter.configs').setup {

    -- A list of parser names, or "all"
    ensure_installed = { "c", "cpp", "bash", "fish", "cmake", "lua", "vim", "vimdoc", "query" },

    sync_install = false,
    modules = {},
    ignore_install = {},
    auto_install = true,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
}

-- Parenthesis Highlighting
use {
  "p00f/nvim-ts-rainbow",
  after = "nvim-treesitter"

}

use "nvim-lua/plenary.nvim"

--Fuzzy Finder
use {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6'
}

-- Smart splits
use('mrjones2014/smart-splits.nvim')

-- Better notifications
use {
  'rcarriga/nvim-notify',
}

-- LSP
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    {'williamboman/mason-lspconfig.nvim'},

    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
    {'onsails/lspkind.nvim'},
  }
}
-- For commenting lines 
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
-- Toggle Term
use {
  "akinsho/toggleterm.nvim",
  tag = '*',
}
use {'stevearc/dressing.nvim'}

use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{
        -- disable_filetype = { "TelescopePrompt", "vim" },
        enable_check_bracket_line = false,
        ignored_next_char = "[%w%.]",
      }
    end
  }

  -- Nerd tree
use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
use {
  'akinsho/bufferline.nvim',
  tag = '*',
  requires = 'nvim-tree/nvim-web-devicons',
  require('bufferline').setup()
}
end)
