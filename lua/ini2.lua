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
local plugins = { "folke/which-key.nvim", { "folke/neoconf.nvim", cmd =
"Neoconf" }, "folke/neodev.nvim", { "Olical/conjure",  branch = "develop" },
"neorg_plugin", {"nvim-treesitter/nvim-treesitter", cmd= "TSUpdate"  },
"Olical/nvim-local-fennel", "Olical/aniseed", "axelf4/vim-strip-trailing-whitespace",
{"glacambre/firenvim" , cmd = instal_firenvim}, "kyazdani42/nvim-web-devicons",
"nvim-treesitter/nvim-treesitter-textobjects",
"neovim/nvim-lspconfig", "ms-jpq/coq_nvim", "vim-syntastic/syntastic",
"ms-jpq/coq_nvim", "aclaimant/syntastic-joker", "rhysd/vim-grammarous",
"ntpeters/vim-better-whitespace", "bling/vim-airline",
"vim-airline/vim-airline-themes", "haya14busa/incsearch.vim",
"tomtom/tcomment_vim", "bling/vim-bufferline", "mattn/emmet-vim",
"Yggdroot/indentLine", "vimlab/split-term.vim", 'kdheepak/lazygit.nvim',
'nvim-lua/plenary.nvim', 'voldikss/vim-floaterm' }




require("lazy").setup(plugins )






local coq = require "coq" -- add this
require'lspconfig'.clojure_lsp.setup{ coq.lsp_ensure_capabilities{} }
require'lspconfig'.texlab.setup{ coq.lsp_ensure_capabilities{} }
require'lspconfig'.pyright.setup{ coq.lsp_ensure_capabilities{} }
require'lspconfig'.ccls.setup{ coq.lsp_ensure_capabilities{} }
require'lspconfig'.rust_analyzer.setup{coq.lsp_ensure_capabilities{}}



local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clojure_lsp' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
     coq.lsp_ensure_capabilities{} ,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

vim.cmd([[COQnow]])


require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"clojure", "lua", "rust",  "java",  "kotlin"}  ,

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {  },

    additional_vim_regex_highlighting = false,
  },
}


require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

 -- these are all the default values















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


