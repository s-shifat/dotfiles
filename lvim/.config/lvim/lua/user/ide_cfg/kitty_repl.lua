-- borrowed and slightly modified from: https://github.com/jghauser/kitty-runner.nvim/blob/main/lua/kitty-runner/kitty-runner.lua
--
local config = require("kitty-runner.config")
local fn = vim.fn
local loop = vim.loop

local M = {}

local whole_command
local runner_is_open = false

local function escape_escape_chars(string)
  return (string:gsub([[\\]], [[\\\]])
    :gsub([[\a]], [[\\a]])
    :gsub([[\b]], [[\\b]])
    :gsub([[\f]], [[\\f]])
    :gsub([[\n]], [[\\n]])
    :gsub([[\r]], [[\\r]])
    :gsub([[\t]], [[\\t]])
    :gsub([[\v]], [[\\v]])
    :gsub([[\"]], [[\\"]])
    :gsub([[\']], [[\\']]))
end

local function send_kitty_command(cmd_args, command)
  local args = { "@", "--to=" .. config["kitty_port"] }
  for _, v in pairs(cmd_args) do
    table.insert(args, v)
  end
  table.insert(args, command)
  loop.spawn("kitty", {
    args = args,
  })
end

local function open_and_or_send(command)
  if runner_is_open == true then
    send_kitty_command(config["run_cmd"], command)
  else
    require("kitty-runner").open_runner()
    -- HACK: wait a bit until the kitty window has opened
    os.execute("sleep .3")
    send_kitty_command(config["run_cmd"], command)
  end
end

local function prepare_command(region)
  local lines
  if region[1] == 0 then
    lines = vim.api.nvim_buf_get_lines(
      0,
      vim.api.nvim_win_get_cursor(0)[1] - 1,
      vim.api.nvim_win_get_cursor(0)[1],
      true
    )
  else
    lines = vim.api.nvim_buf_get_lines(0, region[1] - 1, region[2], true)
  end
  local command = table.concat(lines, "\r")
  return "\\e[200~" .. escape_escape_chars(command) .. "\\e[201~" .. "\r"
end



function M.OpenKittyWithIPython()
  require("kitty-runner").open_runner()
  local command = "export MPLBACKEND='module://matplotlib-backend-kitty' && ipython"
  whole_command = escape_escape_chars(command) .. "\r"
  open_and_or_send(whole_command)
end


return M
