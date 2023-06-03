local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.g.mapleader = " "

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

function neovim_binding(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


local neorg_plugin = {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        ft = 'norg',
	priority = 30,
	dependencies = { "nvim-lua/plenary.nvim",
	'nvim-treesitter/nvim-treesitter-textobjects'} }


local instal_firenvim = "firenvim#instal(0)"
--- not
local plugins = { "folke/which-key.nvim", { "folke/neoconf.nvim", cmd = "Neoconf" }, "folke/neodev.nvim",
"neorg_plugin", {"nvim-treesitter/nvim-treesitter", cmd= "TSUpdate"  },
"Olical/nvim-local-fennel", "Olical/aniseed", "axelf4/vim-strip-trailing-whitespace",
{"glacambre/firenvim" , cmd= instal_firenvim}, "kyazdani42/nvim-web-devicons", "nvim-treesitter/nvim-treesitter-textobjects",
"neovim/nvim-lspconfig", "ms-jpq/coq_nvim", "vim-syntastic/syntastic",
"aclaimant/syntastic-joker", "rhysd/vim-grammarous",
"ntpeters/vim-better-whitespace", "bling/vim-airline",
"vim-airline/vim-airline-themes", "haya14busa/incsearch.vim",
"tomtom/tcomment_vim", "bling/vim-bufferline", "mattn/emmet-vim",
"Yggdroot/indentLine", "vimlab/split-term.vim", 'kdheepak/lazygit.nvim', 'nvim-lua/plenary.nvim', 'voldikss/vim-floaterm' }


require("lazy").setup(plugins )

require('neorg').setup {
    load = {
     ["core.defaults"] = {},
     ["core.concealer"] = {  },
     ["core.export"] = {},
     ["core.dirman"] = {
             config = {
                  workspaces = {
                    notes= "~/.neorg/notes",
                    work= "~/.neorg/work"
                  },
                  default_workspace = "notes",
                     }
             },
     ["core.keybinds"] = {
       config = {
                  default_keybinds = true,
                  neorg_leader = ",",
       },
     },
   },
}


