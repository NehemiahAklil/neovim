local M = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}

M.config = function()
    require("lualine").setup({
        options = {
            theme = 'ayu',
        },
        sections = {
            lualine_c = {
                {
                    "filename",
                    path = 1,
                },
            },
        },
    })
end

return M
