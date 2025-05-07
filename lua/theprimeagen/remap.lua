-- Set leader to space
vim.g.mapleader = " "

-- jump back to vim file explored with space p v
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Jump back to file explorer" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Neotree, { desc = "Jump back to file explorer" })

-- Drag highlighted text up and down with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Drag highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Drag highlighted text up" })

-- Leave your cursor where it is when appending a line
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- ctrl d / u (half pg dwn / up) keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })

-- keep searches in the middle
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search" })

-- space p pastes without copying deleted into buffer
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without copying deleted into buffer" })

-- space p pastes system clipboard
vim.keymap.set("n", "<leader>p<CR>", [["+p]], { desc = "Paste system clipboard" })

-- space y copys to sys clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { desc = "Delete without copying to register" })

-- Gets rid of command console mode
vim.keymap.set("n", "Q", "<nop>", { desc = "Disabled Ex  mode!" })

-- meant to let ctr f let you jump to other projects, dunno why it dont wok bruh
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Jump to other projects" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format code" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = "Make file executable" })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Gravity!?" });
vim.keymap.set("n", "<leader>ms", "<cmd>CellularAutomaton scramble<CR>", { desc = "Scramble!" });
vim.keymap.set("n", "<leader>mg", "<cmd>CellularAutomaton game-of-life<CR>", { desc = "Its Alive!" });

vim.keymap.set("n", "<leader><leader>", function()
        vim.cmd("so")
    end,
    { desc = "Source file" }
)

-- open error in float
vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float({ focusable = true, scope = 'line' }) end,
    { desc = "Expand an Error into a float" })

-- toggle floating box focus
vim.keymap.set("n", "<leader>b", "<cmd>wincmd p<CR>",
    { desc = "Toggle floating box focus", silent = true, noremap = true })

-- open an integrated terminal
vim.keymap.set("n", "<leader>t<CR>", "<cmd>botright split term://$SHELL | resize 15<CR>",
    { desc = "Open an integrated terminal" })
