-- markdown config

return {
	"iamcco/markdown-preview.nvim",
	event = "VeryLazy",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = "cd app && npm install && git restore .",
}
