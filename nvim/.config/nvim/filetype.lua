-- Filetype detection
-- Enable neovim runtime filetype.lua
vim.g.do_filetype_lua = 1

vim.filetype.add({
  filename = {
    ['go.sum'] = 'go',
  },
  pattern = {
    ['Jenkinsfile.*'] = 'groovy',
    ['%.kube/config'] = 'yaml',
    [".*/defaults/.*%.ya?ml"] = "yaml.ansible",
    [".*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/vars/.*%.ya?ml"] = "yaml.ansible",
    -- ['inventory/.*%.ini'] = 'ansible_hosts',
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
  },
})
