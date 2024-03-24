local neoconf = require("neoconf")
local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
-- local lsp_format_on_save = function(bufnr)
--   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--   vim.api.nvim_create_autocmd('BufWritePre', {
--     group = augroup,
--     buffer = bufnr,
--     callback = function()
--       vim.lsp.buf.format()
--       filter = function(client)
--         return client.name == "null-ls"
--       end
--     end,
--   })
-- end
--
require('lspconfig').tsserver.setup({
  single_file_support = false,
  autostart = false
})

require('mason-lspconfig').setup_handlers({
  function(server_name)
    local server_config = {}
    --    print("Test for " .. server_name)
    if neoconf.get(server_name .. ".disable") then
      --      print("Disabeling " .. server_name)
      return
    end
    if server_name == "volar" then
      print("Configuring volar")
      server_config.filetypes = { 'vue', 'typescript', 'javascript' }
    end
    lspconfig[server_name].setup(server_config)
  end,
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  --  lsp_format_on_save(bufnr)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
