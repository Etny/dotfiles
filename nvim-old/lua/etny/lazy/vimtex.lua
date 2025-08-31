return {
    "lervag/vimtex",
    config = function()
        vim.g.vimtex_view_method = "zathura"
        vim.cmd [[
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
]]
    end
}
