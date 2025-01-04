-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add({
  -- extension = {
  --   foo = "fooscript",
  -- },
  -- filename = {
  --   ["Foofile"] = "fooscript",
  -- },
  pattern = {
    [".*/templates/.*%.html"] = "htmldjango",
  },
})

-- Set up custom keymap for luasnip
-- https://github.com/L3MON4D3/LuaSnip/blob/33b06d72d220aa56a7ce80a0dd6f06c70cd82b9d/README.md#keymaps
vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if require("luasnip").choice_active() then
    require("luasnip").change_choice(1)
  end
end, { silent = true })
