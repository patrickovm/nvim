local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
	use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" })

  -- Useful lua functions used by many plugins
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" })

  -- Lazy loading
	use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })

  -- Colorscheme
	use({ "dracula/vim", as = "dracula", commit = "d7723a842a6cfa2f62cf85530ab66eb418521dc2" })

  -- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		commit = "c1a2726704f6fe87bde61a4439ea5d1d8b127cdd",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig", commit = "6b43ce561d97412cc512b569db6938e44529293e" },
			{ "williamboman/mason.nvim", commit = "b8c3fceed16d29a166cf73ce55358f13c9f6cfcc" },
			{ "williamboman/mason-lspconfig.nvim", commit = "aa25b4153d2f2636c3b3a8c8360349d2b29e7ae3" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp", commit = "c49ad26e894e137e401b1d294948c46327877eaf" },
			{ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" },
			{ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" },
			{ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" },
			{ "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" },
			{ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" },

			-- Snippets
			{ "L3MON4D3/LuaSnip", commit = "5570fd797eae0790affb54ea669a150cad76db5d" },
			{ "rafamadriz/friendly-snippets", commit = "1a6a02350568d6830bcfa167c72f9b6e75e454ae" },
		},
	})

	use({ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" })
	use({ "b0o/SchemaStore.nvim", commit = "23bf2d69967491b1dc43f37c809f2711cc879fd2" })
	use({ "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" })
	use({ "j-hui/fidget.nvim", commit = "44585a0c0085765195e6961c15529ba6c5a2a13b" })
	use({ "folke/neodev.nvim", commit = "c045c0fe93b1f9c78443d0f3b88660fffbcf64a7" })

  -- Syntax/Treesitter
	use({ "nvim-treesitter/nvim-treesitter", commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac" })

  -- Fuzzy Finder
	use({ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" })

  -- File Explorer
	use({ "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" })

  -- Statusline
	use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" })

  -- Winbar
	use({ "utilyre/barbecue.nvim", commit = "52fda53fc102cd3ef05ec7d0d3a61c6bc09b0f19" })
	use({ "SmiteshP/nvim-navic", commit = "7a2b823152fe4de65ee7925b0e32d26ed73bc57c" })

  -- Handles buffers and tabs
	use({ "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "tiagovla/scope.nvim", commit = "2db6d31de8e3a98d2b41c0f0d1f5dc299ee76875" })
	use({ "ThePrimeagen/harpoon", commit = "21d0d1bfa3000e4384740bfaefa0ebc51c773786" })

  -- Git
	use({ "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" })
	use({ "f-person/git-blame.nvim", commit = "08e75b7061f4a654ef62b0cac43a9015c87744a2" })

  -- Project
	use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })

  -- Better scrolling
  use({ "karb94/neoscroll.nvim", commit = "54c5c419f6ee2b35557b3a6a7d631724234ba97a" })

  -- Startup
	use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })

  -- Terminal
	use({ "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" })
	
  -- Icons
	use({ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" })

  -- Colors
	use({ "NvChad/nvim-colorizer.lua", commit = "9dd7ecde55b06b5114e1fa67c522433e7e59db8b" })
  
  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
