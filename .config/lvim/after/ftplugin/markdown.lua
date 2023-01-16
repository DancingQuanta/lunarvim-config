-- after/ftplugin/markdown
-- see: https://github.com/brymer-meneses/grammar-guard.nvim
-- DancingQuanta settings

-- install ltex-ls with :Mason

-- Grammar guard
-- Get path to ltex-ls installed with Mason
local mason_path = require('mason.settings').current.install_root_dir

-- Initialize
require('grammar-guard').init()

-- Setup
require("lspconfig").grammar_guard.setup({
  cmd = { mason_path .. '/bin/ltex-ls' }, -- add this if you install ltex-ls yourself
  settings = {
    ltex = {
      enabled = { "latex", "tex", "bib", "markdown" },
      language = "en",
      diagnosticSeverity = "information",
      setenceCacheSize = 2000,
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "en",
      },
      trace = { server = "verbose" },
      dictionary = {},
      disabledRules = {},
      hiddenFalsePositives = {},
    },
  },
})

require("lvim.lsp.manager").setup("marksman")
