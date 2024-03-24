local wk = require("which-key")
local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
  -- toggle term
  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },          -- NodeJS Terminal
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, -- Floating Terminal

    -- Play with size according to your needs.
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- Horizontal Terminal
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },     -- Vertical Terminal
  },
}
wk.setup()
wk.register(mappings, opts)
