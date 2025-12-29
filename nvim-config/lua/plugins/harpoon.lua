local conf = {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.keymap.set('n', 'ha', function()
      require('harpoon.mark').add_file()
    end, { desc = 'Harpoon: Add File' })

    -- non-telescope view
    --[[
    vim.keymap.set('n', 'hq', function()
      require('harpoon.ui').toggle_quick_menu()
    end, { desc = 'Harpoon: Menu' })
    ]]
    --

    vim.keymap.set('n', 'hq', ':Telescope harpoon marks<CR>', { desc = 'Harpoon: Add File' })
  end,
}

return conf
