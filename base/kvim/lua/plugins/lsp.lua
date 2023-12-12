return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true, dependencies = { "nvim-lspconfig" } },
			{ "folke/neodev.nvim", opts = {} },
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- dap
			-- "jay-babu/mason-nvim-dap.nvim",
		},
		keys = {
			{ "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
			{
				"gd",
				function()
					require("telescope.builtin").lsp_definitions({ reuse_win = true })
				end,
				desc = "Goto Definition",
			},
			{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
			{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
			{
				"gI",
				function()
					require("telescope.builtin").lsp_implementations({ reuse_win = true })
				end,
				desc = "Goto Implementation",
			},
			{
				"gy",
				function()
					require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
				end,
				desc = "Goto T[y]pe Definition",
			},
			{ "K", vim.lsp.buf.hover, desc = "Hover" },
			{ "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
			{ "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
			{
				"<leader>cA",
				function()
					vim.lsp.buf.code_action({
						context = {
							only = {
								"source",
							},
							diagnostics = {},
						},
					})
				end,
				desc = "Source Action",
			},
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					vim.defer_fn(function()
						vim.lsp.inlay_hint.enable(args.buf, true)
					end, 1000)
					local opts = { buffer = args.buf }
					vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
					vim.keymap.set({ "n" }, "<leader>rn", vim.lsp.buf.rename, opts)
				end,
			})
			-- local capabilities = require("coq").lsp_ensure_capabilities()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason").setup()
			-- require("mason-nvim-dap").setup({
			-- 	ensure_installed = { "codelldb" },
			-- 	automatic_installation = true,
			-- 	handlers = {
			-- 		function(config)
			-- 			require("mason-nvim-dap").default_setup(config)
			-- 		end,
			-- 	},
			-- })
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ansiblels",
					"bashls",
					"dockerls",
					"lua_ls",
					"jsonls",
					"jqls",
					"lemminx",
					"ltex",
					"marksman",
					"matlab_ls",
					"cmake",
					"perlnavigator",
					"puppet",
					"rust_analyzer",
					"svelte",
					"taplo",
					"vimls",
					"yamlls",
				},
			})
			require("mason-lspconfig").setup_handlers({
				function(sn)
					require("lspconfig")[sn].setup({
						capabilities = capabilities,
					})
				end,
			})
		end,
	},
}
