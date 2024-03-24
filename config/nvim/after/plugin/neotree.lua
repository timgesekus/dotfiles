local wk = require("which-key")
wk.register({
  f = {
    t = { "<cmd>Neotree toggle<cr>", "Toggle neotree" }
  },
  g = {
    s = { "<cmd>Neotree flat git_status<cr>", "Git status" }
  },
}, { prefix = "<leader>" })
vim.api.nvim_set_keymap('n', '<leader>ft', ':Neotree<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':Neotree float git_status<CR>', { noremap = true })
