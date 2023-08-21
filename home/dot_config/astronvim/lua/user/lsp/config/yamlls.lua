return {
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.19.1-standalone-strict/all.json"] = {
          "**/*.k8s.yaml",
          "**/*.k8s.yml",
        },
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      },
      customTags = { "!vault" },
    },
  },
}
