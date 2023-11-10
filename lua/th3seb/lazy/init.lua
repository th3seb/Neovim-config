local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'loctvl842/monokai-pro.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    -- LSP
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    'saadparwaiz1/cmp_luasnip',
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    'nvim-tree/nvim-web-devicons',
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    "nvim-lualine/lualine.nvim"
    ,'folke/todo-comments.nvim'
    ,"christoomey/vim-tmux-navigator"
    ,"github/copilot.vim"
    ,"instant-markdown/vim-instant-markdown"
,        {"prettier/vim-prettier", run = "yarn install", ft = {"javascript", "typescript", "css", "json", "yaml", "markdown", "lua", "typescriptreact"}}

}




local opts = {}

require("lazy").setup(plugins, opts)

