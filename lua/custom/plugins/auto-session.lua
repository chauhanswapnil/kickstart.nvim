local M = {
  'rmagatti/auto-session',
}

local function restore_nvim_tree()
  local nvim_tree = require 'nvim-tree'
  nvim_tree.change_dir(vim.fn.getcwd())
end

M.config = function()
  require('auto-session').setup {
    -- log_level = 'error',
    post_restore_cmds = { restore_nvim_tree, 'NvimTreeOpen' },
    pre_save_cmds = { 'NvimTreeClose' },
    -- auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  }
end

return M
