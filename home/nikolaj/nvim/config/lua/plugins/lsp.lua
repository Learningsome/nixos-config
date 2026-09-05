-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  -- 1. Настройка Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "nix", "lua" } },
  },
  -- 2. Настройка LSP серверов
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          mason = false,
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        nixd = { mason = false },
      },
    },
  },
  -- 3. Настройка форматирования
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "alejandra" },
      },
    },
  },
  -- 4. Настройка линтинга
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        lua = { "luacheck" },
        nix = { "statix" },
      },
    },
  },
}
