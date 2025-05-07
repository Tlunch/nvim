return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

        local Fugitive = vim.api.nvim_create_augroup("Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "<leader>gp", function()
                    vim.cmd.Git('push')
                end, opts, {desc = "Git push"})

                -- git pull, use system default
                vim.keymap.set("n", "<leader>gP", function()
                    vim.cmd.Git({'pull'})
                end, opts, {desc = "Git pull"})

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts, {desc = "Git push -u origin"})
            end,
        })


        vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>", {desc = "Get from left"})
        vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>", {desc = "Get from right"})
    end
}
