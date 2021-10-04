vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function()
    use {"wbthomason/packer.nvim"}
    use {"neovim/nvim-lspconfig"}
    use {"williamboman/nvim-lsp-installer"}
    use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {
	    "nvim-treesitter/nvim-treesitter",
	    run = ':TSUpdate',
    }
    use { 
      "hrsh7th/nvim-cmp",
      config = function()
        local cmp = require'cmp'

        require('cmp').setup({
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
          mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            }),
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
          },
          sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
          }
        })

        require('lspconfig')['tsserver'].setup {
          capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        }
      end,
      requires = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
      }
    }
    use {
      "windwp/nvim-autopairs",
      config = function()
        require('nvim-autopairs').setup()
      end
    }
    use {
      "akinsho/toggleterm.nvim",
      config = function()
        require("toggleterm").setup{
          direction = 'horizontal',
          shade_terminals = false,
          open_mapping = [[<c-t>]],
          size = 20
        }
      end
    }
    use {
      "terrortylor/nvim-comment",
      config = function()
        require('nvim_comment').setup()
      end
    }
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup {
          signs = {
            add = {
              hl = "GitSignsAdd",
              text = "▎",
              numhl = "GitSignsAddNr",
              linehl = "GitSignsAddLn",
            },
            change = {
              hl = "GitSignsChange",
              text = "▎",
              numhl = "GitSignsChangeNr",
              linehl = "GitSignsChangeLn",
            },
            delete = {
              hl = "GitSignsDelete",
              text = "契",
              numhl = "GitSignsDeleteNr",
              linehl = "GitSignsDeleteLn",
            },
            topdelete = {
              hl = "GitSignsDelete",
              text = "契",
              numhl = "GitSignsDeleteNr",
              linehl = "GitSignsDeleteLn",
            },
            changedelete = {
              hl = "GitSignsChange",
              text = "▎",
              numhl = "GitSignsChangeNr",
              linehl = "GitSignsChangeLn",
            },
          }
        }
      end
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require'nvim-tree'.setup {
          auto_close = true
        }
      end
    }
    use {
      "arcticicestudio/nord-vim",
      config = function()
        vim.cmd([[
        highlight NvimTreeVertSplit guibg=#3B4252 guifg=#3B4252
        highlight NvimTreeNormal guibg=#3B4252 guifg=#D8DEE9
        highlight NvimTreeCursorLine guibg=#434C5E
        highlight CursorLineNR gui=bold guifg=#D8DEE9
        highlight NormalFloat guibg=#2E3440
        ]])
      end
    }
    use {"folke/tokyonight.nvim"}
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function()
        require('lualine').setup {
          options = {
            theme = 'nord',
            section_separators = {'', ''},
            component_separators = {'', ''}
          }
        }
      end
    }
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "*" }, {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        })
      end,
    }
    use {
      "karb94/neoscroll.nvim",
      event = "WinScrolled",
      config = function()
        require("neoscroll").setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
          hide_cursor = true, -- Hide cursor while scrolling
          stop_eof = true, -- Stop at <EOF> when scrolling downwards
          use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
          respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil, -- Default easing function
          pre_hook = nil, -- Function to run before the scrolling animation starts
          post_hook = nil, -- Function to run after the scrolling animation ends
        })
      end,
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        vim.g.indentLine_enabled = 1
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
        vim.g.indent_blankline_buftype_exclude = { "terminal" }
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
      end,
    }
  end
)
