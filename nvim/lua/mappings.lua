require "nvchad.mappings"

local map = vim.keymap.set
local term = require "nvchad.term"

map("n", ";", ":", { desc = "CMD enter command mode" })

map({ "n", "t" }, "<A-i>", function()
  term.toggle { pos = "float", id = "amaterasu", cmd = "neofetch" }
end)
map({ "n", "t" }, "<A-s>", function()
  term.toggle { pos = "sp", id = "susanoo" }
end)
map({ "n", "t" }, "<A-v>", function()
  term.toggle { pos = "vsp", id = "tsukuyomi" }
end)

map({ "n", "v", "i" }, "<C-Space>", "$", { silent = true })

map("n", "<A-CR>", function()
  vim.lsp.buf.code_action()
end)

map({ "n", "v" }, "<C-K>", '"_dd', { desc = "Delete a line without saving to clipboard" })

map("n", "<C-l>", "<cmd>AerialToggle!<CR>")

map("n", "<C-M-l>", "<cmd>Lspsaga outline<CR>", { desc = "Open outline" })
