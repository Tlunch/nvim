return {
    -- inline copilot
    {
        "github/copilot.vim",
        -- follow the latest 1.* release
        version = "v1.*",
        lazy = false,
        config = function()
            -- Use Control-J to accept the suggestion
            vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false,
                desc = "Accept the suggestion"
            })
            vim.g.copilot_no_tab_map = true

            -- Use Control-K to cycle the suggestion
            vim.keymap.set('i', '<C-K>', '<Plug>(copilot-next)', { desc = "Cycle the suggestion" })
            vim.keymap.set('i', '<C-S-K>', '<Plug>(copilot-prev)', { desc = "Cycle the suggestion back" })

            -- Use Control-H to cancel the suggestion
            vim.keymap.set('i', '<C-H>', '<Plug>(copilot-cancel)', { desc = "Cancel the suggestion" })

            -- Use Control-L to accept a word
            vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)', { desc = "Accept the word" })
        end
    },

    -- chat copilot
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken",                            -- Only on MacOS or Linux
        opts = {
            show_help = true,                               -- Show help when opening the chat
            -- Floating window rather than a split
            window = {
                layout = 'float',
                relative = 'cursor',
                width = 1,
                height = 0.4,
                row = 1
            }
        },

        config = function(_, opts)
            require("CopilotChat").setup(opts)
            vim.api.nvim_create_autocmd('BufEnter', {
                pattern = "copilot-*",
                callback = function()
                    vim.opt.completeopt = vim.opt.completeopt + "noinsert" + "noselect"
                end
            })
            vim.api.nvim_create_autocmd('BufLeave', {
                pattern = "copilot-*",
                callback = function()
                    vim.opt.completeopt = vim.opt.completeopt - "noinsert" - "noselect"
                end
            })
        end,
        mappings = {
            reset = {
                insert = '',
                normal = '<C-l>',
            },
        },
        keys = {
            -- lazy.nvim keys

            -- Quick chat with Copilot
            {
                "<leader>cq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                    end
                end,
                desc = "CopilotChat - Quick chat",
            },

            -- Toggle Chat
            {
                "<leader>cc",
                function()
                    require("CopilotChat").toggle()
                end,
                desc = "CopilotChat - Toggle",
            },

            -- Reset Chat
            {
                "<leader>cr",
                function()
                    require("CopilotChat").reset()
                end,
                desc = "CopilotChat - Reset",
            },

            -- Select Model
            {
                "<leader>cm",
                "<cmd>CopilotChatModels<CR>",
                desc = "CopilotChat - Select Model",
            },

            -- Select Agent
            {
                "<leader>ca",
                "<cmd>CopilotChatAgents<CR>",
                desc = "CopilotChat - Select Agent",
            },

            -- Explain
            {
                "<leader>ce",
                "<cmd>CopilotChatExplain<CR>",
                desc = "CopilotChat - Explain",
            },




        }
        -- See Commands section for default commands if you want to lazy load on them
    },
}
