return {
  {
    -- Mason (LSP/DAP/Linter installer)
    "williamboman/mason.nvim",
    build = function()
      pcall(vim.cmd, "MasonUpdate")
    end,
    config = function()
      require("mason").setup()
    end,
  },

  {
    -- Mason bridge for nvim-lspconfig
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls" }, -- auto-install servers
        automatic_installation = true,
      })
    end,
  },

  {
    -- LSP core
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      -- Capabilities (for nvim-cmp completion)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Keymaps (similar to lsp-zero recommended preset)
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        local map = vim.keymap.set

        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
        map("n", "<leader>e", vim.diagnostic.open_float, opts)
      end

      -- Example: gopls setup
      lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          gopls = {
            directoryFilters = { "-plz-out" },
            linksInHover = false,
            usePlaceholders = false,
            semanticTokens = true,
            codelenses = {
              gc_details = true,
            },
          },
        },
        root_dir = function(fname)
          local gowork_or_gomod_dir = util.root_pattern("go.work", "go.mod")(fname)
          if gowork_or_gomod_dir then
            return gowork_or_gomod_dir
          end

          local plzconfig_dir = util.root_pattern(".plzconfig")(fname)
          if plzconfig_dir and vim.fs.basename(plzconfig_dir) == "src" then
            vim.env.GOPATH = string.format("%s:%s/plz-out/go", vim.fs.dirname(plzconfig_dir), plzconfig_dir)
            vim.env.GO111MODULE = "off"
          end

          return vim.fn.getcwd()
        end,
      })
    end,
  },

  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
