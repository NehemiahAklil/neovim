local M = {
    'goolord/alpha-nvim',
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
}

return M
