return {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	config = function()
		require("lsp_signature").setup({
			max_height = 4,
			max_width = 60,
			doc_lines = 0,
			handler_opts = {
				border = "rounded",
				zindex = 200,
			},
			bind = true,
			floating_window = false,
			floating_window_above_cur_line = true,
			fix_pos = false,
			hint_enable = false,
			hint_prefix = "󰌵 ",
			hint_scheme = "String",

			extra_trigger_chars = { "(", "," },
			toggle_key = "<M-x>",
			active_parameter = "PmenuSel",
		})
	end,
}

