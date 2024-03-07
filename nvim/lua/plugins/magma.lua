return {
    {
        "dccsillag/magma-nvim",
        build = ":UpdateRemotePlugins",

        config = function()
            -- vim.api.nvim_set_keymap('n', '<LocalLeader>r', ':MagmaEvaluateOperator<CR>', { silent = true, expr = true })
            vim.api.nvim_set_keymap('n', '<LocalLeader>rr', ':MagmaEvaluateLine<CR>', { silent = true })
            vim.api.nvim_set_keymap('x', '<LocalLeader>r', ':<C-u>MagmaEvaluateVisual<CR>', { silent = true })
            vim.api.nvim_set_keymap('n', '<LocalLeader>rc', ':MagmaReevaluateCell<CR>', { silent = true })
            vim.api.nvim_set_keymap('n', '<LocalLeader>rd', ':MagmaDelete<CR>', { silent = true })
            vim.api.nvim_set_keymap('n', '<LocalLeader>ro', ':MagmaShowOutput<CR>', { silent = true })

            vim.g.magma_automatically_open_output = true
            vim.g.magma_image_provider = "kitty"

            function MagmaInitPython()
                vim.cmd[[
                :MagmaInit python3
                :MagmaEvaluateArgument a=5
                ]]
            end

            vim.cmd[[
                command! MagmaInitPython lua MagmaInitPython()
            ]]
        end
    }
}
