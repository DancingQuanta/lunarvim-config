--[[
DancingQuanta's LunarVim config.

Tips:
* lvim is the global options object
* Linters should be filled in as strings with either a global executable or a
  path to an executable
* After changing plugin config exit and reopen LunarVim, Run :PackerInstall
  :PackerCompile

Additional programs:
* lazygit
]]


-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "lunar"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
lvim.leader = "space"

-- Core plugins' configurations
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Telescope
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.

-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- which-key
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- Terminal
lvim.builtin.terminal.active = true
lvim.builtin.terminal.size = 90
lvim.keys.normal_mode["<C-b>"] = "<esc><cmd>ToggleTermSendCurrentLine<CR>"
lvim.keys.visual_mode["<C-b>"] = ":'<,'>ToggleTermSendVisualLines<CR>"
lvim.keys.term_mode["<C-l>"] = "<C-l>"

-- Treesitter
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- LSP settings

-- Diagnostics
-- lvim.lsp.diagnostics.virtual_text = false
vim.diagnostic.config({ virtual_text = false })

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "marksman",
  "clangd",
  "pylsp",
  "ltex",
}

-- Extra plugins
lvim.plugins = {
  {"folke/trouble.nvim", cmd = "TroubleToggle"},
  {"brymer-meneses/grammar-guard.nvim"},
  {"michaelb/sniprun", build = 'bash ./install.sh'},
  -- { "lervag/vimtex" },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   run = "cd app && npm install",
  --   ft = "markdown",
  --   config = function()
  --     vim.g.mkdp_auto_start = 0
  --   end,
  -- },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"
