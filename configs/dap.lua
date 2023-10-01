------------------------------------------------------------------------------]]
--Setup Presinstalled Adapter(s)
------------------------------------------------------------------------------]]
require("custom.dap")

------------------------------------------------------------------------------]]
--Some configs for DAP and DAP-UI
------------------------------------------------------------------------------]]
local dap = require("dap")
local dapui = require("dapui")

dap.set_log_level("TRACE")

-- Open/Close UI, when DAP starts/ends
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.after.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Enable virtual text
vim.g.dap_virtual_text = true

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➡", texthl = "", linehl = "", numhl = "" })

------------------------------------------------------------------------------]]
-- Load Project DAP Config
------------------------------------------------------------------------------[[
local projectLSPFile = vim.fn.getcwd() .. "/.nvim/dap.lua"
if vim.fn.findfile(projectLSPFile) ~= "" then
  dofile(projectLSPFile)
end
