return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	opts = { use_diagnostic_signs = true },
  -- stylua: ignore
	keys = {
		vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble" }),
    vim.keymap.set('n', "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {desc = "Document Diagnostics (Trouble)"}),
    vim.keymap.set('n', "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {desc = "Workspace Diagnostics (Trouble)"}),
		vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "Location List (Trouble)" }),
		vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfix List (Trouble)" }),
	},
}
