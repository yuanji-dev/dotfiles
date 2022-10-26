-- nvim-lsp-installer settings
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', opts)
  --buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  buf_set_keymap("n", "<space>bf", "<cmd>lua vim.lsp.buf.format{async = true}<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig.util")
util.default_config = vim.tbl_extend("force", util.default_config, {
  capabilities = capabilities,
  on_attach = on_attach,
})

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
})
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = {
    "ansiblels",
    "eslint",
    "gopls",
    "pyright",
    "sumneko_lua",
    "tsserver",
    "yamlls",
  }
})
local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim", "runtime_path" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.gopls.setup({
  settings = {
    -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
    gopls = {
      usePlaceholders = true,
      staticcheck = true,
      gofumpt = true,
      ['local'] = '',

      analyses = {
        unusedparams = true,
        unreachable = true,
        shadow = true,
      },

      codelenses = {
        generate = true,
        gc_details = true,
      },

      -- Not supported yet by NeoVim, https://github.com/neovim/neovim/issues/18086
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    }
  }
})

lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.19.1-standalone-strict/all.json"] = {
          "**/*.k8s.yaml",
          "**/*.k8s.yml",
        },
      },
      customTags = { "!vault" },
    },
  },
})

lspconfig.pyright.setup({
  settings = {
    python = {
      analysis = {
        diagnosticMode = "openFilesOnly",
      },
    },
  },
})

lspconfig.eslint.setup {}
lspconfig.ansiblels.setup {}
-- lspconfig.groovyls.setup {}

lspconfig.tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end
})

require("null-ls").setup({
  -- you must define at least one source for the plugin to work
  sources = {
    require("null-ls").builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
    require("null-ls").builtins.diagnostics.shellcheck,
    require("null-ls").builtins.code_actions.shellcheck,
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.diagnostics.hadolint,
    require("null-ls").builtins.diagnostics.vale,
    require("null-ls").builtins.diagnostics.stylelint.with({
      prefer_local = "node_modules/.bin",
    }),
    require("null-ls").builtins.diagnostics.revive,
  },
  on_attach = on_attach,
})
