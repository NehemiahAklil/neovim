local M = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>" },
        { "<leader>hu", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
        { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>" },
        { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>" },
        { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>" },
    },
}

return M
