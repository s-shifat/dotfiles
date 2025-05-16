return {
  "akinsho/bufferline.nvim",
  lazy = false,
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local icons = {
      diagnostics = {
        Error = "",
        Warning = "",
        Information = "",
      },
      ui = {
        BoldLineLeft = "▎",
        Close = "",
        Circle = "",
        BoldClose = "",
        ArrowCircleLeft = "",
        ArrowCircleRight = "",
      },
    }

    local function diagnostics_indicator(num, _, diagnostics, _)
      local result = {}
      for name, count in pairs(diagnostics) do
        local icon = icons.diagnostics[name:sub(1, 1):upper() .. name:sub(2)]
        if icon and count > 0 then
          table.insert(result, icon .. " " .. count)
        end
      end
      return #result > 0 and table.concat(result, " ") or "(" .. num .. ")"
    end

    local function is_ft(b, ft)
      return vim.bo[b].filetype == ft
    end

    local function custom_filter(buf, buf_nums)
      local logs = vim.tbl_filter(function(b)
        return is_ft(b, "log")
      end, buf_nums or {})
      if vim.tbl_isempty(logs) then
        return true
      end
      local tab_num = vim.fn.tabpagenr()
      local last_tab = vim.fn.tabpagenr "$"
      local is_log = is_ft(buf, "log")
      return (tab_num == last_tab and is_log) or (tab_num ~= last_tab and not is_log)
    end

    vim.opt.termguicolors = true
    vim.opt.showtabline = 2

    require("bufferline").setup {
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = function(bufnr)
          vim.cmd("bd " .. bufnr)
        end,
        right_mouse_command = "vert sbuffer %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          icon = icons.ui.BoldLineLeft,
          style = "icon",
        },
        buffer_close_icon = icons.ui.Close,
        modified_icon = icons.ui.Circle,
        close_icon = icons.ui.BoldClose,
        left_trunc_marker = icons.ui.ArrowCircleLeft,
        right_trunc_marker = icons.ui.ArrowCircleRight,
        name_formatter = function(buf)
          if buf.name:match("%.md") then
            return vim.fn.fnamemodify(buf.name, ":t:r")
          end
        end,
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = diagnostics_indicator,
        custom_filter = custom_filter,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "Directory",
            padding = 1,
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "id",
      },
    }

  end,
}

