return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  config = function()
    require("lsp_signature").setup({
      bind = true,
      floating_window = true,
      floating_window_above_cur_line = true,
      fix_pos = false,
      hint_enable = true,
      hint_prefix = "󰌵 ",
      hint_scheme = "String",
      max_height = 4,
      max_width = 80,
      doc_lines = 2,
      handler_opts = {
        border = "rounded",
        zindex = 200,
      },
      extra_trigger_chars = { "(", "," },
      toggle_key = "<M-x>",
      active_parameter = "PmenuSel",
    })
  end,
}

