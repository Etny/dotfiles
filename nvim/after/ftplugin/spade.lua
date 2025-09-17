-- require("spade").setup({ lazy = false })
--

local function current_buffer_path()
    return vim.fn.expand("%:p")
end

local function swim_root_dir()
    return vim.fs.dirname(vim.fs.find({ "swim.toml" }, {
        path = current_buffer_path(),
        type = "file",
        upward = true,
    })[1])
end

if swim_root_dir() ~= nil then
    -- see https://neovim.discourse.group/t/how-to-add-a-custom-server-to-nvim-lspconfig/3925
    vim.lsp.start({
        name = "spade-lsp",
        cmd = { "spade-language-server" },
        root_dir = swim_root_dir(),
    })
else
    vim.notify("No `swim.toml` configuration found", vim.log.levels.WARN)
end
