---@type NvPluginSpec
return {
  "neovim/nvim-lspconfig",
  config = function()
    -- load defaults i.e lua_lsp
    require("nvchad.configs.lspconfig").defaults()

    local lspconfig = require "lspconfig"

    local servers = {
      "html",
      "cssls",
      "bashls",
      "clangd",
      "docker_compose_language_service",
      "dockerls",
      "gopls",
      "jsonls",
      "rust_analyzer",
      "ts_ls",
      "pyright",
    }

    local nvlsp = require "nvchad.configs.lspconfig"

    -- lsps with default config
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
      }
    end

    lspconfig.rust_analyzer.setup {
      on_attach = function(_, bufnr)
        if nvlsp.on_attach then
          nvlsp.on_attach(_, bufnr)
        end
        local mode = vim.api.nvim_get_mode().mode
        vim.lsp.inlay_hint.enable(mode == "n" or mode == "r", { bufnr = bufnr })
      end,
      root_dir = function()
        return vim.fn.getcwd()
      end,
      cmd = { "rustup", "run", "stable", "rust-analyzer" },
      settings = {
        rust_analyzer = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          autoImportCompletions = false,
          reportMissingImports = true,
          followImportForHints = true,

          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            command = "cargo clippy",
          },
        },
      },
    }
  end,
}
