return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gq', '<cmd>DiffviewClose<cr>', desc = 'Close Diffview' },
  },
  config = function()
    require('diffview').setup {
      enhanced_diff_hl = true,
      view = {
        default = { layout = 'diff2_horizontal' },
        merge_tool = { layout = 'diff3_mixed' },
      },
      keymaps = {
        view = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' } },
          { 'n', '<S-n>', 'h', { desc = 'Move left' } },
          { 'n', '<S-e>', 'j', { desc = 'Move down' } },
          { 'n', '<S-u>', 'k', { desc = 'Move up' } },
          { 'n', '<S-i>', 'l', { desc = 'Move right' } },
          { 'n', '<C-S-n>', function() require('diffview.config').actions.select_next_entry() end, { desc = 'Next file' } },
          { 'n', '<C-n>', function() require('diffview.config').actions.select_prev_entry() end, { desc = 'Previous file' } },
        },
        file_panel = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' } },
          { 'n', '<S-n>', 'h', { desc = 'Move left' } },
          { 'n', '<S-e>', 'j', { desc = 'Move down' } },
          { 'n', '<S-u>', 'k', { desc = 'Move up' } },
          { 'n', '<S-i>', 'l', { desc = 'Move right' } },
        },
        file_history_panel = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' } },
          { 'n', '<S-n>', 'h', { desc = 'Move left' } },
          { 'n', '<S-e>', 'j', { desc = 'Move down' } },
          { 'n', '<S-u>', 'k', { desc = 'Move up' } },
          { 'n', '<S-i>', 'l', { desc = 'Move right' } },
        },
      },
    }

    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#1a3a2a' })
        vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#3a1a1a' })
        vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#1a2a3a' })
        vim.api.nvim_set_hl(0, 'DiffText', { bg = '#2a4a3a' })
      end,
    })

    vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#1a3a2a' })
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#3a1a1a' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#1a2a3a' })
    vim.api.nvim_set_hl(0, 'DiffText', { bg = '#2a4a3a' })
  end,
}
