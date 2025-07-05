-- =============== [[ Basic Keymaps ]] =============== --
require("snacks")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- keep the cursor in the middle of the page for j, k, and searching
vim.keymap.set('n', 'j', 'jzz')
vim.keymap.set('n', 'k', 'kzz')

-- recentre when stepping through searches
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- recentre when paging up or down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- jj to exit insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })

-- LSP Hierarchy
vim.keymap.set('n', 'ghh', vim.lsp.buf.incoming_calls, { desc = 'Hierarchy in' })
vim.keymap.set('n', 'gho', vim.lsp.buf.outgoing_calls, { desc = 'Hierarchy out' })

-- allows paste without the delete overwriting the register
vim.keymap.set('x', '<leader>p', [["_dP]])

-- yanks into the system register
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- quickfix navigation
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz')

-- Delete to void register
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

vim.keymap.set('n', 'Q', '<nop>')

-- Open a new tmux session in the selected folder - requires tmux-sessionizer bash script
vim.keymap.set('n', '<leader>fs', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- neorg
vim.keymap.set({ 'n' }, '<leader>ni', '<cmd>Neorg index<CR>', { desc = '[neorg] Open index' })
vim.keymap.set('n', '<leader>nt', '<cmd>edit /home/edwardsm/notes/todo.norg<CR>', { desc = '[neorg] Open todo' })
vim.keymap.set('n', '<leader>nf', '<cmd>FzfLua files cwd=/home/edwardsm/notes/ sort_mru=true sort_lastused=true<cr>', { desc = 'Notes files' })
--vim.keymap.set('n', '<leader>ns', LazyVim.pick('live_grep', { cwd = '/home/edwardsm/notes/' }), { desc = 'Search in notes' })

vim.keymap.set('n', '<leader>no', '<cmd>Neorg toc<CR>', { desc = '[neorg] Open toc' })
vim.keymap.set('n', '<leader>ncb', 'i@code<CR>@end<Esc>kA', { desc = '[neorg] New code block' })
vim.keymap.set('n', '<leader>ncp', 'i@code bash<CR>@end<Esc>ko<Esc>p', { desc = '[neorg] Paste as code block' })

vim.keymap.set('n', '<leader>nn', 'i- ( ) ', { desc = '[neorg] New todo item' })
vim.keymap.set('n', '<leader>nd', '<Plug>(neorg.qol.todo-items.todo.task-done)', { desc = '[neorg] Mark todo done' })
vim.keymap.set('n', '<leader>nu', '<Plug>(neorg.qol.todo-items.todo.task-undone)', { desc = '[neorg] Mark todo undone' })

-- Format whole page
vim.keymap.set('n', 'fp', 'gg=G<C-o>', { desc = 'Format page and go back to prev location' })

-- CodeCompanion shortcuts
vim.keymap.set({ 'n', 'v' }, '<leader>at', '<cmd>CodeCompanionChat Toggle<CR><cmd>set winwidth=70<CR>', { desc = '[CodeCompanion] Toggle chat' })
vim.keymap.set({ 'n', 'v' }, '<leader>ae', '<cmd>CodeCompanion /explain<CR>', { desc = '[CodeCompanion] Explain selected code' })
vim.keymap.set({ 'n', 'v' }, '<leader>aa', '<cmd>CodeCompanionActions<CR>', { desc = '[CodeCompanion] Show actions' })
vim.keymap.set('v', '<leader>aca', '<cmd>CodeCompanionChat Add<CR>', { desc = '[CodeCompanion] Add to chat' })

-- Terminal keymaps
vim.keymap.set("n", "<C-t>", function() Snacks.terminal() end, { desc = "Terminal (Root Dir)" })
vim.keymap.set("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- vim.keymap.set('t', '<C-space>', '<C-\\><C-n><C-w>p', { desc = 'Switch back to last buffer from terminal' })

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +4<cr>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -4<cr>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -4<cr>', { desc = 'Decrease Window Width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +4<cr>', { desc = 'Increase Window Width' })

-- Move Lines
vim.keymap.set('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- buffers
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
vim.keymap.set("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })

-- saner-behavior-of-n-and-N
vim.keymap.set('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
vim.keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
vim.keymap.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- Add undo break-points
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', ';', ';<c-g>u')

-- better indenting, keeps lines highlighted for multiple tabbing
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

--new file
vim.keymap.set('n', '<C-n>', '<cmd>enew<cr>', { desc = 'New File' })

-- quit
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- windows
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })
--Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<c-n>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Use H and L to move between buffers
vim.keymap.set('n', 'H', '<cmd>bprevious<cr>', { desc = 'Move to previous buffer' })
vim.keymap.set('n', 'L', '<cmd>bnext<cr>', { desc = 'Move to next buffer' })

-- toggle option
Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>uw')
Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
Snacks.toggle.diagnostics():map('<leader>ud')
Snacks.toggle.line_number():map('<leader>ul')
Snacks.toggle.animate():map('<leader>ua')
Snacks.toggle.indent():map('<leader>ug')
Snacks.toggle.scroll():map('<leader>uS')

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map('<leader>uh')
end


-- tmux sessionizer keymaps
-- vim.keymap.del("n", "<C-f>") -- remove default keymap
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
vim.keymap.set("n", "<M-t>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")
vim.keymap.set("n", "<M-n>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>")
vim.keymap.set("n", "<M-s>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>")

