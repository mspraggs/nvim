return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
	  function()
        require("conform").format({ async = true, lsp_format = "fallback" })
	  end,
	  mode = "",
	  desc = "[F]ormat buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "black" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "format",
    },
  },
}
