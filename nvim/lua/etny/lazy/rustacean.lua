return {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false,   -- This plugin is already lazy
    ft = "rust",
    opts = {
        server = {
            default_settings = {
                ['rust-analyzer'] = {
                    cargo = {
                        allFeatures = true
                    },
                    -- Add clippy lints for Rust if using rust-analyzer
                    checkOnSave = diagnostics == "rust-analyzer",
                    -- Enable diagnostics if using rust-analyzer
                    diagnostics = {
                        enable = diagnostics == "rust-analyzer",
                        disabled = {"inactive-code"}
                    },
                    completion = {
                        postfix = {
                            enable = false,
                        },
                    }

                }
            }
        }
    },
    config = function(_, opts)
        vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    end
}
