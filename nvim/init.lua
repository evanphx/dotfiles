require 'plugins'

local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false

bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true

o.incsearch = true
o.hidden = true
o.hlsearch = true

o.completeopt='menuone,noinsert,noselect'

bo.autoindent = true
bo.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.number = true
o.signcolumn = 'yes'

o.splitbelow = true
o.wildmenu = true
o.wildmode="list:longest"
o.ruler = true
o.showcmd = true
o.laststatus = 2

o.updatetime = 300
o.shortmess = "c"

o.background = "dark"
o.mouse = "a"

o.mapleader = ","

vim.g.nord_italic = true

vim.cmd [[colorscheme nordic]]

vim.g.clipboard = {
  name = "tmux",
  copy = {
    ["+"] = {"tmux", "load-buffer", "-"},
    ["*"] = {"tmux", "load-buffer", "-"},
  },
  paste = {
    ["+"] = {"tmux", "save-buffer", "-"},
    ["*"] = {"tmux", "save-buffer", "-"},
  }
}

require 'keymaps'
require 'plugin_setup'
