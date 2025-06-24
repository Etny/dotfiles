local telescope = require('telescope')
local mapper = require('nvim-mapper')
telescope.setup()
telescope.load_extension("mapper")



local function open_telescope(data)
    if data.file == "" then
        builtin.find_files()
    elseif vim.fn.isdirectory(data.file) == 1 then
        vim.cmd.cd(data.file)
        builtin.find_files()
    end
end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_telescope })
