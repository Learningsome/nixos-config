local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    base00 = "#142925",
    base01 = "#22443e",
    base02 = "#1f3d38",
    base03 = "#62726c",
    base04 = "#afb6b4",
    base05 = "#f2f3f2",
    base06 = "#f2f3f2",
    base07 = "#f2f3f2",
    base08 = "#fd4663",
    base09 = "#6688cc",
    base0A = "#92d65c",
    base0B = "#67e4bb",
    base0C = "#96b1e9",
    base0D = "#93eccf",
    base0E = "#bae996",
    base0F = "#d6f4be",
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi("TelescopeNormal", { fg = "#f2f3f2", bg = "#142925" })
  hi("TelescopeBorder", { fg = "#62726c", bg = "#142925" })
  hi("TelescopePromptNormal", { fg = "#f2f3f2", bg = "#142925" })
  hi("TelescopePromptBorder", { fg = "#62726c", bg = "#142925" })
  hi("TelescopePromptPrefix", { fg = "#67e4bb", bg = "#142925" })
  hi("TelescopePromptCounter", { fg = "#afb6b4", bg = "#142925" })
  hi("TelescopePromptTitle", { fg = "#142925", bg = "#67e4bb" })
  hi("TelescopePreviewTitle", { fg = "#142925", bg = "#92d65c" })
  hi("TelescopeResultsTitle", { fg = "#142925", bg = "#6688cc" })
  hi("TelescopeSelection", { fg = "#f2f3f2", bg = "#1f3d38" })
  hi("TelescopeSelectionCaret", { fg = "#67e4bb", bg = "#1f3d38" })
  hi("TelescopeMatching", { fg = "#67e4bb", bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M
