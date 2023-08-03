-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'bkad/CamelCaseMotion'
  use 'christoomey/vim-tmux-navigator'
  use 'NLKNguyen/papercolor-theme'
  use {'chriskempson/tomorrow-theme', rtp = 'vim/' }
  use 'scrooloose/nerdcommenter'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-markdown'
  use 'tpope/vim-surround'
  use 'tpope/vim-sleuth'
  use 'NvChad/nvterm'
  -- Plug 'TimUntersberger/neogit'
  use 'kazhala/close-buffers.nvim'

  use 'marko-cerovac/material.nvim'
  use 'tjdevries/colorbuddy.nvim'
  use 'evanphx/nordbuddy'
  use 'norcalli/nvim-base16.lua'
  use 'stevearc/dressing.nvim'
  use 'nyoom-engineering/oxocarbon.nvim'
  use 'PHSix/nvim-hybrid'
  use 'rmehri01/onenord.nvim'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind.nvim'
  use 'folke/lsp-colors.nvim'
  use 'fenetikm/falcon'

  use { 'j-hui/fidget.nvim', tag = 'legacy' }

  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  -- Plug 'hrsh7th/vim-vsnip-integ'

  use 'mfussenegger/nvim-dap'
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "leoluz/nvim-dap-go"

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'nvim-treesitter/playground'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'glepnir/dashboard-nvim'
  use 'lewis6991/gitsigns.nvim'

  -- Plug 'vim-airline/vim-airline'
  -- Plug 'vim-airline/vim-airline-themes'

  use {'glepnir/galaxyline.nvim' , branch = 'main'}
  -- If you want to display icons, then use one of these plugins:
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  use 'liuchengxu/vista.vim'
  use 'ray-x/lsp_signature.nvim'
end)
