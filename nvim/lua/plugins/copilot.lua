return {
    "github/copilot.vim",

    config = function ()
        local function SuggestOneWord()
          local suggestion = vim.fn['copilot#Accept']("")
          local bar = vim.fn['copilot#TextQueuedForInsertion']()
          return bar:match("%S+")
        end

        local function SuggestOneLine()
          local suggestion = vim.fn['copilot#Accept']("")
          local bar = vim.fn['copilot#TextQueuedForInsertion']()
          return bar:match("[^\n]+")
        end

        local map = vim.keymap.set
        map('i', '<C-w>', SuggestOneWord, {expr = true, remap = false})
        map('i', '<C-l>', SuggestOneLine, {expr = true, remap = false})
    end,
}
