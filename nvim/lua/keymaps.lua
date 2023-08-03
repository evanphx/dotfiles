local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-- Go into insert mode on a newline below this one
map('n', ']<space>', 'A<CR>')

-- Use Control-N to clear the highlighted search
map('n', '<C-N>', ':silent noh<CR>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':silent nohl<CR>')

map('', 'w', '<Plug>CamelCaseMotion_w')
map('', 'b', '<Plug>CamelCaseMotion_b')
map('', 'e', '<Plug>CamelCaseMotion_e')

local tb = require('telescope.builtin')

map('n', "<leader>ff", tb.find_files)
map('n', "<leader>fg", tb.live_grep)
map('n', "<leader>be", function() 
  tb.buffers({sort_lastused=true, ignore_current_buffer=true})
end)
map('n', "<leader>fh", tb.help_tags)
map('n', "<leader>R", tb.lsp_references)


map('', '<leader>i', vim.lsp.buf.hover)
map('', '<leader>T', vim.lsp.buf.type_definition)
map('', '<leader>S', vim.lsp.buf.document_symbol)
map('', '<leader>C', vim.lsp.buf.incoming_calls)
map('', '<leader>rn', vim.lsp.buf.rename)
map('', '<leader>l', vim.diagnostic.goto_next)
map('', '<leader>e', vim.diagnostic.open_float)

local cb = require('close_buffers')

map('', '<leader>d', function()
  cb.delete({ type = 'this' }) -- Delete the current buffer
end)

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- tmux keys
map('t', '<C-h>', '<C-\\><C-N><C-w>h')
map('t', '<C-j>', '<C-\\><C-N><C-w>j')
map('t', '<C-k>', '<C-\\><C-N><C-w>k')
map('t', '<C-l>', '<C-\\><C-N><C-w>l')
