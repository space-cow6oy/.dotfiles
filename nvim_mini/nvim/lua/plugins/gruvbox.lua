return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = {
			transparent_mode = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
