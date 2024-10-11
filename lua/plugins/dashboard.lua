local M = {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}

M.config = function()
    local dashboard = require('dashboard')
    local logo = [[
        ███╗   ██╗███████╗ ██████╗ ████████╗██████╗ ███████╗██████╗ ██╗███████╗
        ████╗  ██║██╔════╝██╔═══██╗╚══██╔══╝██╔══██╗██╔════╝██╔══██╗██║██╔════╝
        ██╔██╗ ██║█████╗  ██║   ██║   ██║   ██████╔╝█████╗  ██║  ██║██║███████╗
        ██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██╔══██╗██╔══╝  ██║  ██║██║╚════██║
        ██║ ╚████║███████╗╚██████╔╝   ██║   ██║  ██║███████╗██████╔╝██║███████║
        ╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝╚══════╝
    ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"
    dashboard.setup({
        theme = 'doom',
        config = {
            header = vim.split(logo, "\n"),
            center = {
                {
                    icon = ' ',
                    icon_hl = 'Title',
                    desc = 'Find File           ',
                    desc_hl = 'String',
                    key = 'b',
                    keymap = 'SPC f f',
                    key_hl = 'Number',
                    key_format = ' %s', -- remove default surrounding `[]`
                    action = 'lua print(2)'
                },
                {
                    icon = ' ',
                    desc = 'Find Dotfiles',
                    key = 'f',
                    keymap = 'SPC f d',
                    key_format = ' %s', -- remove default surrounding `[]`
                    action = 'lua print(3)'
                },
                {
                    icon = '  ',
                    desc = 'Open folder                ',
                    action = 'Telescope file_browser',
                    shortcut = 'SPC f o',
                },
            },
            footer = {} --your footer
        }
    })
end

return M
