-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require("null-ls")

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.prettierd.with({
        filetypes = { "html", "json", "yaml", "markdown", "htmldjango" },
      }),
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.diagnostics.hadolint,
      null_ls.builtins.diagnostics.vale,
      null_ls.builtins.diagnostics.stylelint.with({
        prefer_local = "node_modules/.bin",
      }),
      -- null_ls.builtins.diagnostics.pylint,
      null_ls.builtins.diagnostics.rubocop,
      null_ls.builtins.formatting.rubocop,
      null_ls.builtins.diagnostics.erb_lint,
      null_ls.builtins.formatting.erb_lint,
      null_ls.builtins.formatting.htmlbeautifier,
      null_ls.builtins.formatting.djlint,
    }
    config.default_timeout = 10000 -- 10s to wait pylint
    return config -- return final config table
  end,
}
