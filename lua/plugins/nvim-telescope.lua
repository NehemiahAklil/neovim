local M = {
	"nvim-telescope/telescope.nvim",
	event = 'VimEnter',
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			'jvgrootveld/telescope-zoxide',
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
				require("telescope").load_extension("projects")
				require("telescope").load_extension("file_browser")
				require("telescope").load_extension('zoxide')
			end,
		},
	},
	keys = {
		{
			"<space>ff",
			-- "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
			"<cmd>lua require'telescope.builtin'.find_files()<CR>",
		},
		{
			"<space>fg",
			"<cmd>lua require'telescope.builtin'.live_grep()<CR>",
		},
		{
			"<space>fp",
			"<cmd>lua require'telescope'.extensions.project.project{}<CR>"
		},
		{
			"<leader>z",
			"<cmd>lua require'telescope'.extensions.project.zoxide.list<CR>"
		}
	},
}

M.config = function()
	local telescope = require("telescope")
	local project_actions = require("telescope._extensions.project.actions")
	telescope.setup({
		defaults = {
			file_ignore_patterns = { "node_modules" },
			mappings = {
				i = {
					--["q"] = require("telescope.actions").close,
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
			},
		},
		extensions = {
			project = {
				base_dirs = {
					'~/dev/src',
					{ '~/dev/src2' },
					{ '~/dev/src3',        max_depth = 4 },
					{ path = '~/dev/src4' },
					{ path = '~/dev/src5', max_depth = 2 },
				},
				hidden_files = true, -- default: false
				theme = "dropdown",
				order_by = "asc",
				search_by = "title",
				sync_with_nvim_tree = true, -- default false
				-- default for on_project_selected = find project files
				on_project_selected = function(prompt_bufnr)
					-- Do anything you want in here. For example:
					project_actions.change_working_directory(prompt_bufnr, false)
					require("harpoon.ui").nav_file(1)
				end,
				mappings = {
					n = {
						['d'] = project_actions.delete_project,
						['r'] = project_actions.rename_project,
						['c'] = project_actions.add_project,
						['C'] = project_actions.add_project_cwd,
						['f'] = project_actions.find_project_files,
						['b'] = project_actions.browse_project_files,
						['s'] = project_actions.search_in_project_files,
						['R'] = project_actions.recent_project_files,
						['w'] = project_actions.change_working_directory,
						['o'] = project_actions.next_cd_scope,
					},
					i = {
						['<c-d>'] = project_actions.delete_project,
						['<c-v>'] = project_actions.rename_project,
						['<c-a>'] = project_actions.add_project,
						['<c-A>'] = project_actions.add_project_cwd,
						['<c-f>'] = project_actions.find_project_files,
						['<c-b>'] = project_actions.browse_project_files,
						['<c-s>'] = project_actions.search_in_project_files,
						['<c-r>'] = project_actions.recent_project_files,
						['<c-l>'] = project_actions.change_working_directory,
						['<c-o>'] = project_actions.next_cd_scope,
						['<c-w>'] = project_actions.change_workspace,
					}
				}
			}
		}
	})
end

return M
