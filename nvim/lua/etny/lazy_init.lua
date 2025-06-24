local lazypth = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install lazy if it isn't already
if not (vim.uv or vim.loop).fs_stat(lazypth) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypth,
    })
end

vim.opt.rtp:prepend(lazypth)

require("lazy").setup({
    spec = "etny.lazy",
    change_detection = { notify = false }
})
