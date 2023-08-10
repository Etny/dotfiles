local tree = require("nvim-tree")

tree.setup {
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
}
