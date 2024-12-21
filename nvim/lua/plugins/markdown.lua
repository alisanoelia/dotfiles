return {
	"iamcco/markdown-preview.nvim",
	"MeanderingProgrammer/markdown.nvim",
	enabled = true,
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = "cd app && npm install && git restore .",
}
