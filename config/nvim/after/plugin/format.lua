local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    javascript = formatters.lsp,
    typescript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    vue = formatters.prettierd,
    yaml = formatters.lsp,
    lua = formatters.lsp,
    unison = formatters.lsp,
  },
  -- Optional: fallback formatter to use when no formatters match the current filetype
  fallback_formatter = {
    formatters.lsp,
  },
  run_with_sh = false,
})
