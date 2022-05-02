" PLUGINS

call plug#begin('~/.dotfiles/nvim/plugged')

Plug 'bkad/CamelCaseMotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'TimUntersberger/neogit'

Plug 'marko-cerovac/material.nvim'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'evanphx/nordbuddy'
Plug 'norcalli/nvim-base16.lua'
Plug 'stevearc/dressing.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'lewis6991/gitsigns.nvim'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons' " vimscript

Plug 'liuchengxu/vista.vim'
Plug 'ray-x/lsp_signature.nvim'

" Plug 'golang/vscode-go'

call plug#end()

"END PLUGINS

"VIML CONFIG

set nocompatible
set termguicolors
set splitbelow
set cpoptions=aABceFsWZ
set wildmenu     " fancy command completion menu!
set wildmode=list:longest
set number      " show line numbers
set showbreak=+ " display a + at the beginning of a wrapped line
set showmatch   " flash the matching bracket on inserting a )]} etc
set linebreak 
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set autowrite
set autoindent " automatically indent new lines
set softtabstop=2 " most of the time, we want a softtabstop of 4
set shiftwidth=2  " shift by 4 spaces when using >> and <<, etc
set tabstop=2
set expandtab     " no tabs, just spaces kthx.
set ignorecase " makes search patterns case-insensitive by default
set smartcase  " overrides ignorecase when the pattern contains
               " upper-case characters
set incsearch  " incremental search. 'nuf said
set hlsearch   " highlight searches
set ruler          " shows cursor position in the lower right
set showcmd        " shows incomplete command to the left of the ruler
set winminheight=1 " allow windows to be 0 lines tall
set winminwidth=1  " allow windows to be 0 lines wide
set laststatus=2   " always show statusline

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

set background=dark
set mouse=a

set completeopt=menu,menuone,noselect

let g:airline_theme='tomorrow'

let g:airline_powerline_fonts = 1

let mapleader=',' " set leader to ,

let NERDCreateDefaultMappings=0 " disable default mappings
let NERDMenuMode=0              " disable menu
let NERDSpaceDelims=1           " place spaces after comment chars
let NERDDefaultNesting=0        " don't recomment commented lines

" let g:nord_underline_option = 'none'
let g:nord_italic = v:true
" let g:nord_italic_comments = v:false

let g:material_style = 'deep ocean'

if !has("gui_running")
    " vim hardcodes background color erase even if the terminfo file does
    " not contain bce (not to mention that libvte based terminals
    " incorrectly contain bce in their terminfo files). This causes
    " incorrect background rendering when using a color theme with a
    " background color.
    "
    " see: https://github.com/kovidgoyal/kitty/issues/108
    let &t_ut=''
endif

filetype off
syntax enable
colorscheme nordic

" << KEY MAPPINGS >>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Go into insert mode on a newline below this one
nmap ]<space> A<CR>

" Use Control-N to clear the highlighted search
nmap <silent> <C-N> :silent noh<CR>

" replace the normal word movement keys with smart versions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e

map <leader>cc <plug>NERDCommenterToggle
map <leader>cC <plug>NERDCommenterSexy
map <leader>cu <plug>NERDCommenterUncomment

" cd to the directory containing the file in the buffer. Both the local
" and global flavors.
nmap <leader>cd :cd %:h<CR>
nmap <leader>lcd :lcd %:h<CR>

" Shortcut to yanking to the system clipboard
map <leader>y "*y
map <leader>p "*p

" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

map <leader>i <Cmd>lua vim.lsp.buf.hover()<CR>
map <leader>T <cmd>lua vim.lsp.buf.type_definition()<CR>
map <leader>S <cmd>lua vim.lsp.buf.document_symbol()<CR>
map <leader>C <cmd>lua vim.lsp.buf.incoming_calls()<CR>
map <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
map <leader>l <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
map <leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>be <cmd>lua require('telescope.builtin').buffers({sort_lastused=true, ignore_current_buffer=true})<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>R <cmd>lua require('telescope.builtin').lsp_references()<cr>

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

lua <<EOF

-- local base16 = require 'base16'
-- base16(base16.themes["tomorrow-night"], true)


  function goimports(timeout_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end

    vim.lsp.buf.formatting_sync()
  end
EOF

autocmd BufWritePre *.go lua goimports(1000)

"END VIML CONFIG

lua <<LUA
local servers = { "gopls" }

-- Setup lspconfig.
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  require('lsp_signature').on_attach({
    bind = true,
    doc_lines = 0,
    floating_window = false,
    hint_scheme = 'Comment',
  })
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }
end

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp['gopls'].setup{
  cmd = {'gopls'},
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      staticcheck = true,
    },
  }
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
      return vim_item
    end,

    -- format = lspkind.cmp_format(),
  },
  snippet = {
   expand = function(args)
     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
   end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    ["<Up>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    ["<Down>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

require('nvim-treesitter.configs').setup {
 highlight = {
   enable = true,
 },
 indent = {
   enable = true
 }
}

LUA

source $HOME/.dotfiles/nvim/config.lua
