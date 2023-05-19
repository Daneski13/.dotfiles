require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})

require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			hide_hidden = false,
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
			".DS_Store",
			"thumbs.db",
		},
	},
})
