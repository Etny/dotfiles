local tree = require("nvim-tree")

tree.setup {
    disable_netrw = false,
    actions = {
        open_file = {
            quit_on_open = true
        }
    },
}

-- require('nvim-ts-autotag').setup();

local function open_nvim_tree(data)
    if data.file == "" then
        require("nvim-tree.api").tree.open()
    elseif vim.fn.isdirectory(data.file) == 1 then
        vim.cmd.cd(data.file)
        require("nvim-tree.api").tree.open()
    end
end

-- open on startup if we are opening a folder
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })



