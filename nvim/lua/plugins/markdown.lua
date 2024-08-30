return {
	"iamcco/markdown-preview.nvim",
	"MeanderingProgrammer/markdown.nvim",
	enabled = true,
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function() vim.fn["mkdp#util#install"]() end,
}
