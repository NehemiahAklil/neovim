local M = {
    "glepnir/dashboard-nvim",
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
}

M.config = function()
    local db = require('dashboard')
    local project_nvim = require("project_nvim")
    local recent_projects = project_nvim.get_recent_projects()

    print(vim.inspect(recent_projects))
    db.setup({
        theme = 'doom', -- or 'hyper' for different themes
        config = {
            header = {
                [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
                [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
                [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
                [[ ██║╚██╗██║██╔══╝  ██║   ██║██║   ██║██║██║╚██╔╝██║]],
                [[ ██║ ╚████║███████╗╚██████╔╝╚██████╔╝██║██║ ╚═╝ ██║]],
                [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝     ╚═╝]],
                'Welcome to NeoVim!',
            },
            center = {
                {
                    icon = '  ',
                    desc = 'Open folder                ',
                    action = 'Telescope file_browser',
                    shortcut = 'SPC f o',
                },
                -- {
                --     icon = '  ',
                --     desc = 'Recently opened files      ',
                --     action = 'Telescope oldfiles',
                --     shortcut = 'SPC f r',
                -- },
                {
                    icon = '  ',
                    desc = 'Find file                  ',
                    action = 'Telescope find_files',
                    shortcut = 'SPC f f',
                },
                {
                    icon = '  ',
                    desc = 'Find word                  ',
                    action = 'Telescope live_grep',
                    shortcut = 'SPC f w',
                },
                {
                    icon = '  ',
                    desc = 'Open Neovim config         ',
                    action = 'edit ~/.config/nvim/init.lua',
                    shortcut = 'SPC f c',
                },
            },
            footer = {
                'Happy coding!',
            }
        }
    })
end


return M
