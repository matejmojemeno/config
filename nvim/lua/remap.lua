-- Easy pane navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Turn off highlight from search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- :terminal puts you into terminal mode, double <Esc> to exit
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Insert new line in normal mode
vim.keymap.set("n", "<C-CR>", "o<Esc>", { desc = "Insert new line" })
vim.keymap.set("n", "<S-CR>", "O<Esc>", { desc = "Insert new line above" })

-- HACK: remapped <C-BS> to <C-b> in wezterm config, so CTRL + Backspace deletes a word in insert mode
vim.keymap.set("i", "<C-b>", "<C-W>", { desc = "Delete word before cursor" })
