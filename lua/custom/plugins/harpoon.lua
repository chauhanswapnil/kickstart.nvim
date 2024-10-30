local M = {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}

function M.config()
  local harpoon = require 'harpoon'
  harpoon:setup {}
  -- basic telescope configuration
  local conf = require('telescope.config').values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require('telescope.pickers')
      .new({}, {
        prompt_title = 'Harpoon',
        finder = require('telescope.finders').new_table {
          results = file_paths,
        },
        previewer = conf.file_previewer {},
        sorter = conf.generic_sorter {},
      })
      :find()
  end

  vim.keymap.set('n', '<leader>hh', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, { desc = 'Open harpoon window' })

  vim.keymap.set('n', '<leader>ha', function()
    harpoon:list():add()
  end, { desc = 'Append to Harpoon' })

  vim.keymap.set('n', '<leader>hj', function()
    harpoon:list():select(1)
  end, { desc = 'Select Buffer 1' })

  vim.keymap.set('n', '<leader>hk', function()
    harpoon:list():select(2)
  end, { desc = 'Select Buffer 2' })

  vim.keymap.set('n', '<leader>hl', function()
    harpoon:list():select(3)
  end, { desc = 'Select Buffer 3' })

  vim.keymap.set('n', '<leader>h;', function()
    harpoon:list():select(4)
  end, { desc = 'Select Buffer 4' })

  --   h = {
  --     name = "Harpoon",
  --     ["1"] = { "<cmd>lua require('harpoon'):list():select(1)<cr>", "Select 1" },
  --     ["2"] = { "<cmd>lua require('harpoon'):list():select(2)<cr>", "Select 2" },
  --     ["3"] = { "<cmd>lua require('harpoon'):list():select(3)<cr>", "Select 3" },
  --     ["4"] = { "<cmd>lua require('harpoon'):list():select(4)<cr>", "Select 4" },
  --     ["a"] = { "<cmd>lua require('harpoon'):list():append()<cr>", "Append" },
  --     ["h"] = { "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>", "Toggle Quick Menu" },
  -- -- vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
  -- -- vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
  --   },
end

return M
