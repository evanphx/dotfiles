local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-- Go into insert mode on a newline below this one
map('n', ']<space>', 'A<CR>')

-- Use Control-N to clear the highlighted search
map('n', '<silent> <C-N>', ':silent noh<CR>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

map('', '<leader>i', '<Cmd>lua vim.lsp.buf.hover()<CR>')
map('', '<leader>T', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('', '<leader>S', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('', '<leader>C', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
map('', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('', '<leader>l', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')


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
