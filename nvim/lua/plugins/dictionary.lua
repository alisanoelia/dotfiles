return {
	"uga-rosa/cmp-dictionary",
	config = function()
		require("cmp_dictionary").setup({
			paths = { "/home/alyssa/.palabras/palabras" },
			exact_length = 2,
			first_case_insensitive = true,
			document = {
				enable = true,
				command = { "dict", "${label}", "-over" },
			},
		})
	end

}
