return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "relative",
                importModuleSpecifierEnding = "minimal",
                includePackageJsonAutoImports = "off",
              },
            },
            javascript = {
              preferences = {
                importModuleSpecifier = "relative",
                importModuleSpecifierEnding = "minimal",
                includePackageJsonAutoImports = "off",
              },
            },
          },
        },
      },
    },
  },
}
