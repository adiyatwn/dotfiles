-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- See `:help vim.keymap.set()`

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local harpoon = require("harpoon")

harpoon:setup()

-- Remap for tmux navigation
keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- New tab
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<Tab>", ":tabnext<Return>", opts)
keymap.set("n", "<S-Tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Move line(s) up or down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remap to move half a page and center the cursor
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- util keymaps
keymap.set("n", "<leader>x", ":!chmod +x %<CR>")
keymap.set("n", "<C-f>", ":silent !tmux neww ~/scripts/tmux-sessionizer<CR>")

-- Open Oil buffer
vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Go to oil buffer" })

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Harpoon keymaps
keymap.set("n", "<leader>a", function() harpoon:list():append() end)
--
-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
  { desc = "Open harpoon window" })

keymap.set("n", "<A-h>", function() harpoon:list():select(1) end)
keymap.set("n", "<A-j>", function() harpoon:list():select(2) end)
keymap.set("n", "<A-k>", function() harpoon:list():select(3) end)
keymap.set("n", "<A-l>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- Open Notes folder
keymap.set("n", "<leader>n", ":edit ~/notes<CR>", { desc = "Edit notes folder", noremap = true, silent = true })
