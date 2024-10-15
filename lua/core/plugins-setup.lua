-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- 这个是onedarkpro 的主题
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
        config = function()
            -- 设置主题
            require("onedarkpro").setup({
                options = {
                    transparency = true,
                },
            })
            -- 应用 OneDark 主题
            vim.cmd("colorscheme onedark")
        end,
    },
    -- lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        priority = 1000,
        config = function()
            require('plugins.lualine')
        end,
    },
    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        -- version = "*",   -- 使用最新版本的nvim-tree
        lazy = false,  -- 不进行懒启动
        dependencies = { "nvim-tree/nvim-web-devicons", },
        config = function()
            require('plugins.nvim-tree')
        end,
    },
    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            require('plugins.treesitter')
        end,
    },
    -- nvim-autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('plugins.autopairs')
        end,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    -- indent-blankline 这个是用来展示缩进竖线的
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    -- telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins.telescope')
        end,
    },
    -- mason-lspconfig
    {
        "williamboman/mason.nvim",
        dependencies = { 'williamboman/mason-lspconfig.nvim',"neovim/nvim-lspconfig"},
        config = function()
            require('plugins.lsp')
        end,
    },

    -- persistence 这个是用来保留上次进度的
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
        -- add any custom options here
    },
    -- 这个是注释
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
    },
    -- 这个实施前面一些应用的依赖，我其实也可以不写
    {   "nvim-lua/plenary.nvim", lazy = true },
    -- TODO:ll
    -- 从后面开始的东西我就不是很熟悉了
	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("plugins.cmp")
		end,
	},

	-- Code snippet engine
    -- 这两个插件都是不怎么需要config 的，所以我这里就没弄lua 文件了
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
    {
        "garymjr/nvim-snippets",
        opts = {
        friendly_snippets = true,
        },
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    { "rafamadriz/friendly-snippets" },
}
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "onedark" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
