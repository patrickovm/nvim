require("neodev").setup()

local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
	-- Get nvim-navic working on multiple tabs
	if client.server_capabilities["documentSymbolProvider"] then
		require("nvim-navic").attach(client, bufnr)
	end
end)

lsp.setup()

require("fidget").setup()
require("patrick.lsp.null-ls")
