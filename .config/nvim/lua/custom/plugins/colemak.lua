--
-- Helper function to set keymaps across multiple modes
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
-- CORE MOVEMENT - Physical QWERTY: jikl → Colemak: nuei
-- =============================================================================

-- Normal, Visual, and Operator-pending modes
map({ 'n', 'x' }, 'n', 'h', { desc = 'Move left' }) -- j→n (left)
map({ 'n', 'x' }, 'e', 'j', { desc = 'Move down' }) -- i→e (down)
map({ 'n', 'x' }, 'u', 'k', { desc = 'Move up' }) -- k→u (up)
map({ 'n', 'x' }, 'i', 'l', { desc = 'Move right' }) -- l→i (right)

-- Operator-pending mode: DON'T remap 'i' so text objects work
map('o', 'n', 'h', { desc = 'Move left' })
map('o', 'u', 'j', { desc = 'Move down' })
map('o', 'e', 'k', { desc = 'Move up' })
-- Remap Ctrl+E to Ctrl+D for faster scrolling
map({ 'n', 'v', 'i' }, '<C-e>', '<C-d>', { desc = 'Scroll down faster' })

-- Window navigation
map('n', '<C-w>n', '<C-w>h', { desc = 'Window left' })
map('n', '<C-w>e', '<C-w>j', { desc = 'Window down' })
map('n', '<C-w>u', '<C-w>k', { desc = 'Window up' })
map('n', '<C-w>i', '<C-w>l', { desc = 'Window right' })

-- =============================================================================
-- MODE CHANGES - Remap insert since 'i' is now right movement
-- =============================================================================

-- Use 'f' for insert (physical QWERTY 'e' position)
map('n', 'f', 'i', { desc = 'Insert mode' }) -- f→insert
map('n', 'F', 'I', { desc = 'Insert at line beginning' }) -- F→Insert

-- Keep append at its physical location
map('n', 'a', 'a', { desc = 'Append' }) -- a→a (same)
map('n', 'A', 'A', { desc = 'Append at line end' }) -- A→A (same)

-- =============================================================================
-- QWERTY → COLEMAK PHYSICAL POSITION MAPPINGS
-- =============================================================================

-- Commands that change based on physical key position
map({ 'n', 'x', 'o' }, 'p', 'r', { desc = 'Replace' }) -- r→p
map({ 'n', 'x', 'o' }, 'g', 't', { desc = 'Till' }) -- t→g
map({ 'n', 'x', 'o' }, 'j', 'y', { desc = 'Yank' }) -- y→j
map({ 'n', 'x', 'o' }, 'l', 'u', { desc = 'Undo' }) -- u→l
map({ 'n', 'x', 'o' }, 'y', 'o', { desc = 'Open line' }) -- o→y
map({ 'n', 'x', 'o' }, ';', 'p', { desc = 'Paste' }) -- p→;

-- Second row mappings
map({ 'n', 'x', 'o' }, 's', 'd', { desc = 'Delete' }) -- d→s
map({ 'n', 'x', 'o' }, 't', 'f', { desc = 'Find' }) -- f→t
map({ 'n', 'x', 'o' }, 'd', 'g', { desc = 'Go' }) -- g→d
map({ 'n', 'x', 'o' }, 'h', 'h', { desc = 'Help' }) -- h→h (same)
map({ 'n', 'x', 'o' }, 'k', 'n', { desc = 'Next search' }) -- n→k
map({ 'n', 'x', 'o' }, 'o', ';', { desc = 'Repeat f/t' }) -- ;→y

-- Keep important commands at their physical locations
map({ 'n', 'x', 'o' }, 'c', 'c', { desc = 'Change' }) -- c→c (same)
map({ 'n', 'x', 'o' }, 'x', 'x', { desc = 'Delete char' }) -- x→x (same)
map({ 'n', 'x', 'o' }, 'v', 'v', { desc = 'Visual mode' }) -- v→v (same)
map({ 'n', 'x', 'o' }, 'r', 's', { desc = 'Substitute' }) -- s→r

-- Capital letter variants
map({ 'n', 'x' }, 'S', 'D', { desc = 'Delete to end of line' })
map({ 'n', 'x' }, 'P', 'R', { desc = 'Replace mode' })
map({ 'n', 'x' }, 'G', 'T', { desc = 'Till backward' })
map({ 'n', 'x' }, 'J', 'Y', { desc = 'Yank line' })
map({ 'n', 'x' }, 'L', 'U', { desc = 'Redo' })
map({ 'n', 'x' }, 'Y', 'O', { desc = 'Open line above' })
map({ 'n', 'x' }, ':', 'P', { desc = 'Paste before' })
map({ 'n', 'x' }, 'T', 'F', { desc = 'Find backward' })
map({ 'n', 'x' }, 'D', 'G', { desc = 'Go to line' })
map({ 'n', 'x' }, 'K', 'N', { desc = 'Previous search' })
map({ 'n', 'x' }, 'C', 'C', { desc = 'Change to end of line' })
map({ 'n', 'x' }, 'X', 'X', { desc = 'Delete char backward' })
map({ 'n', 'x' }, 'V', 'V', { desc = 'Visual line mode' })
map({ 'n', 'x' }, 'R', 'S', { desc = 'Substitute line' })
map({ 'n', 'x' }, 'O', ':', { desc = 'Repeat f/t' }) -- ;→y

-- Note: 'F' is now Insert at beginning of line, not 'end of WORD'
-- For end of WORD, we need a different mapping
map({ 'n', 'x', 'o' }, 'gf', 'E', { desc = 'End of WORD' })

-- =============================================================================
-- VISUAL MODE SPECIFIC
-- =============================================================================

map('x', 'au', 'ij', { desc = 'Inner word (visual)' })
map('x', 'su', 'iw', { desc = 'Inner word' })
map('x', 'Iu', 'iW', { desc = 'Inner WORD' })

-- =============================================================================
-- COMMAND MODE MAPPINGS
-- =============================================================================

-- For command mode, we need to use cnoremap
vim.cmd [[
  " Movement in command line
  cnoremap <C-n> <C-h>
  cnoremap <C-e> <C-j>
  cnoremap <C-u> <C-k>
  cnoremap <C-i> <C-l>
]]

return {}
