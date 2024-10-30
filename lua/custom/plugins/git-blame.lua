local M = {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
}

function M.config()
  require('gitblame').setup {
    enabled = false,
  }
end

return M
