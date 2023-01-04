local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
  return
end

barbecue.setup({
	create_autocmd = false, -- prevent barbecue from updating itself automatically
	attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
})

vim.api.nvim_create_autocmd({
	"WinScrolled",
	"BufWinEnter",
	"CursorHold",
	"InsertLeave",

	-- include these if you have set `show_modified` to `true`
	"BufWritePost",
	"TextChanged",
	"TextChangedI",
}, {
	group = vim.api.nvim_create_augroup("barbecue#create_autocmd", {}),
	callback = function()
		require("barbecue.ui").update()
	end,
})
