local M = {
  'linux-cultist/venv-selector.nvim',
  lazy = false,
  branch = 'regexp', -- This is the regexp branch, use this for the new version
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>vs', '<cmd>VenvSelect<cr>', { desc = 'Venv Selector' } },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>vc', '<cmd>VenvSelectCached<cr>', { desc = 'Venc Select Cached' } },
  },
}

function M.config()
  require('venv-selector').setup {
    pyenv_path = '/Users/swapnilchauhan/.pyenv/versions',
  }
  -- vim.api.nvim_create_autocmd('VimEnter', {
  --   desc = 'Auto select virtualenv Nvim open',
  --   pattern = '*',
  --   callback = function()
  --     local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
  --     if venv ~= '' then
  --       require('venv-selector').retrieve_from_cache()
  --     end
  --   end,
  --   once = true,
  -- })
end

return M
