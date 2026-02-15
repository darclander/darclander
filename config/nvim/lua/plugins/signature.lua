return {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	config = function()
		require("lsp_signature").setup({
			max_height = 4,
			max_width = 60,
			doc_lines = 4,
			handler_opts = {
				border = "rounded",
				zindex = 200,
			},
			wrap = true,
			bind = true,
			floating_window = true,
			floating_window_above_cur_line = false,
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

