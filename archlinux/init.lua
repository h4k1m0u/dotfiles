--[[
Saved to ~/.config/nvim/init.lua
To get latest neovim version on ubuntu, copy prebuilt release & add its bin path to .bashrc

# Prerequisites
- Install NerdFonts (Hack): needed to render icons in nvim plugins (telescope...)
$ curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
$ getnf
Select Hack font
Close & reopen terminal

- Install lua-language-server (for ycm-like suggestions): On ubuntu copy prebuilt release & add its bin path to .bashrc
]]--

-- change colorscheme
vim.cmd('colorscheme habamax')

-- global variable vim.g
vim.g.mapleader = ','
vim.opt.number = true  -- show line numbers
vim.opt.shiftwidth = 2   -- # of spaces in an indent (tab)

-- save file
vim.keymap.set('n', '<leader>w', ':w!<CR>')

-- navigation between panes
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', '<leader>h', '<C-W>h')
vim.keymap.set('n', '<leader>l', '<C-W>l')
vim.keymap.set('n', '<leader>j', '<C-W>j')
vim.keymap.set('n', '<leader>k', '<C-W>k')
vim.keymap.set('n', '<leader>q', ':bd<CR>')

-- buffers navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>')

-- vertical navigation
vim.keymap.set('n', '<leader>f', '<C-d>')
vim.keymap.set('n', '<leader>b', '<C-u>')

-- block by block navigation
vim.keymap.set('n', 'tj', '}')
vim.keymap.set('n', 'tk', '{')

-- install plugins
vim.pack.add({
  -- nvim-tree (nerdtree alternative)
  'https://github.com/nvim-tree/nvim-tree.lua',
  'https://github.com/nvim-tree/nvim-web-devicons', -- optional

  -- telescope (ctrlp alternative)
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/plenary.nvim',

  -- lualine & bufferline (vim-airline alternative)
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/akinsho/bufferline.nvim',

  -- nvim-lspconfig (ycm alternative)
  'https://github.com/neovim/nvim-lspconfig', -- lsp servers config
  'https://github.com/hrsh7th/nvim-cmp', -- autocomplete
  'https://github.com/hrsh7th/cmp-nvim-lsp', -- bridge between cmp & lsp
  'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help', -- functions signatures
})

-- nvim-tree (nerdtree)
require("nvim-tree").setup({})
vim.keymap.set('n', '<F2>', ':NvimTreeToggle<CR>')

-- tagbar

-- telescope (ctrlp)
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files)

-- lualline (vim-airline: bottom status line)
require('lualine').setup()

-- bufferline (vim-airline: top buffers tab)
require("bufferline").setup{}

--------------------------------------------------
-- LSP (autocomplete & linter)
--------------------------------------------------

-- nvim-cmp autocomplete source
local cmp = require('cmp')
cmp.setup {
  -- navigate suggestions
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm(),
  }),
  sources = {
    { name = 'nvim_lsp' }, -- autocomplete
    { name = "nvim_lsp_signature_help" }, -- functions signatures
  }
}

-- configure clangd/pyright/lua_ls LSP servers to use nvim-cmp as a completion engine
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', { capabilities = capabilities })

-- nvim-lspconfig (ycm)
-- needed to configure lsp cmds & matching filetypes
-- enable language servers (clangd for c/c++, pyright for python, lua-language-server for lua)
vim.lsp.enable({ 'clangd', 'pyright', 'lua_ls' })

-- shows error messages directly at the end of the line (doesn't work without enabling lsp above)
vim.diagnostic.config({ virtual_text = true })
