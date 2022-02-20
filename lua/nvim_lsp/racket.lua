local configs = require 'nvim_lsp/configs'
local util = require 'nvim_lsp/util'

configs.racket_language_server = {
  default_config = {
    cmd = {"racket -l racket-langserver"};
    filetypes = {"racket"};
    root_dir = function(fname)
      return vim.fn.getcwd()
    end;
  };
  docs = {
    description = [[
https://github.com/jeapostrophe/racket-langserver
racket-langserver is a Language Server Protocol implementation for Racket. This
project seeks to use DrRacket's public APIs to provide functionality that
mimics DrRacket's code tools as closely as possible.
    ]];
    default_config = {
      root_dir = "vim's starting directory";
    };
  };
};
-- vim:et ts=2 sw=2
