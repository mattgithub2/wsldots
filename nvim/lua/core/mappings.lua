-- VimTex
vim.g.UltiSnipsExpandTrigger = '<a-q>'
vim.g.UltiSnipsJumpForwardTrigger = '<a-tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<c-tab>'
vim.g.vimtex_view_method = 'zathura'
vim.g.tex_fast = "bMpr"
vim.g.auto_save = 1
-- vim.g.vimtex_quickfix_mode = 0
vim.cmd("set conceallevel=1")
-- vim.g.tex_conceal = 'abdmg'

-- Which-key stuff
local wk = require("which-key")
wk.register({ -- Normal mode
  ["<leader>"] = {
    q = { ":VimtexCompile<CR>", "Compile LaTeX with Vimtex" },
    r = { ":Telescope notify<CR>", "Check error log" },
    f = {
      name = "+files",
      f = { ":Telescope find_files<CR>", "Find Files" },
      r = { ":Telescope oldfiles<CR>", "Recent Files" },
      g = { ":Telescope live_grep<CR>", "Live Grep" },
    },
    b = {
      name = "+buffer",
      b = { ":Telescope buffers<CR>", "List Buffers" },
      w = { ":bwipeout<CR>", "Wipe Buffer" },
    },
    --TODO
    t = {
      name = "+Terminal",
      f = { ":ToggleTerm direction=float<cr>", "Floating Terminal" },
      h = { ":ToggleTerm size=10 direction=horizontal<cr>", "Horizontal Terminal" },
      v = { ":ToggleTerm size=80 direction=vertical<cr>", "Vertical Terminal" },
    },
    e = { ":Neotree<CR>", "Open NeoTree"},
    ["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Toggle Comment" },
    ["7"] = { "<cmd>e ~/latex/template/preamble.tex<cr>", "Edit Preamble" },
  },
}, { mode = "n" })

wk.register({ -- Visual mode
  ["<leader>"] = {
    q = { ":VimtexCompile<CR>", "Compile LaTeX with Vimtex" },
    f = {
      name = "+files",
      f = { "<Esc><cmd>Telescope find_files<CR>", "Find Files" },
      r = { "<Esc><cmd>Telescope oldfiles<CR>", "Recent Files" },
      g = { "<Esc><cmd>Telescope live_grep<CR>", "Live Grep" },
    },
    b = {
      name = "+buffer",
      b = { "<Esc><cmd>Telescope buffers<CR>", "List Buffers" },
      w = { "<Esc><cmd>bwipeout<CR>", "Wipe Buffer" },
    },
    ["/"] = { "<Esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", "Toggle Comment" },
  },
}, { mode = "v" })

-- Smart-splits
 -- resizing
vim.api.nvim_set_keymap('n', '<A-h>', '<cmd>lua require("smart-splits").resize_left()<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<A-l>', '<cmd>lua require("smart-splits").resize_right()<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', '<cmd>lua require("smart-splits").resize_up()<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<A-j>', '<cmd>lua require("smart-splits").resize_down()<cr>', {silent = true})
 -- Moving between splits
 vim.api.nvim_set_keymap('n', '<A-f>', '<cmd>lua require("smart-splits").move_cursor_left()<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<A-g>', '<cmd>lua require("smart-splits").move_cursor_right()<cr>', {silent = true})

-- ThePrimeagen remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


