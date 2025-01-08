return {
	"aurum77/live-server.nvim",
	enabled = false,
	config = function()
		require("live_server.util").install()
	end,
	cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
}
