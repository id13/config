-- Minimal Neovim configuration for Colemak
-- Only navigation with Shift+NEUI and Ctrl+E/U for scrolling

-- Helper function to set keymaps
local function map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  opts.silent = opts.silent == nil and true or opts.silent

  if type(modes) == 'string' then
    modes = { modes }
  end
  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- =============================================================================
-- NAVIGATION WITH SHIFT+NEUI
-- =============================================================================

map({ 'n', 'v' }, '<S-n>', 'h', { desc = 'Move left' })
map({ 'n', 'v' }, '<S-e>', 'j', { desc = 'Move down' })
map({ 'n', 'v' }, '<S-u>', 'k', { desc = 'Move up' })
map({ 'n', 'v' }, '<S-i>', 'l', { desc = 'Move right' })

-- =============================================================================
-- SCROLLING WITH CTRL+E/U
-- =============================================================================

map({ 'n', 'v' }, '<C-e>', '<C-d>', { desc = 'Scroll down (half page)' })
map({ 'n', 'v' }, '<C-u>', '<C-u>', { desc = 'Scroll up (half page)' })

return {}
