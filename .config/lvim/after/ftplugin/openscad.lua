-- require('lspconfig').openscad_lsp.setup{}
--
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "openscad_lsp" })
require("lvim.lsp.manager").setup("openscad_lsp")

