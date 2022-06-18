-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to space
map('', "<Space>", "<nop>") -- First disable space key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Option/Alt + Backspace deletes word instead of entering Normal Mode
map('i', '<A-BS>', '<C-w>')

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
--map('n', '<leader>r', ':so %<CR>')
map('n', '<leader>r', ':so $MYVIMRC<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')
--map('i', '<leader>s', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-- Just type ; to enter commmand mode when in normal mode
map('n', ';', ':', { silent = false })
map('v', ';', ':', { silent = false })

-- Shift+Tab to inverse tab
map('i', '<S-Tab>', '<C-d>')

-- Resize with arrows

--map("n", "<leader><Up>", ":resize -2<CR>")
--map("n", "<leader><Down>", ":resize +2<CR>")
--map("n", "<leader><Left>", ":vertical resize -2<CR>")
--map("n", "<leader><Right>", ":vertical resize +2<CR>")

-- Indent w/ Visual Mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true }) -- open
map('t', '<Esc>', '<C-\\><C-n>') -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>') -- open/close
--map('n', '<leader>f', ':NvimTreeRefresh<CR>') -- refresh
--map('n', '<leader>n', ':NvimTreeFindFile<CR>') -- search file

-- Tagbar
--map('n', '<leader>z', ':TagbarToggle<CR>') -- open/close

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader><Tab>', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')

-- Nerdcommenter
map('n', '<C-_>', '<plug>NERDCommenterToggle')
map('v', '<C-_>', '<plug>NERDCommenterSexy')

-- git-blame
map('n', '<leader>gb', ':GitBlameToggle<CR>')

--  formatting
map('n', '<leader>b', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = false })