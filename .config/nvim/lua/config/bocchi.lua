-- bocchi.lua - Bocchi The Rock! inspired Neovim colorscheme

local M = {}

M.colors = {
  bg     = "#1e1a2b",
  fg     = "#f8cdda",

  black  = "#3b3052",
  red    = "#f17fbd",
  green  = "#a6f3a6",
  yellow = "#f9e6a5",
  blue   = "#9a88ff",
  magenta= "#d38fff",
  cyan   = "#7ec8c8",
  white  = "#f8cdda",

  bright_black   = "#5b527a",
  bright_red     = "#f2a6c6",
  bright_green   = "#c2f3c2",
  bright_yellow  = "#f9f1a5",
  bright_blue    = "#b1a7ff",
  bright_magenta = "#e1aaff",
  bright_cyan    = "#91dada",
  bright_white   = "#ffecf1",
}

function M.setup()
  local c = M.colors

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background = "dark"
  vim.g.colors_name = "bocchi"

  local hi = function(group, styles)
    local style_str = ""
    if styles.fg then style_str = style_str .. "guifg="..styles.fg.." " end
    if styles.bg then style_str = style_str .. "guibg="..styles.bg.." " end
    if styles.sp then style_str = style_str .. "guisp="..styles.sp.." " end
    if styles.gui then style_str = style_str .. "gui="..styles.gui.." " end
    vim.cmd("hi "..group.." "..style_str)
  end

  -- Basic UI
  hi("Normal",       { fg = c.fg, bg = c.bg })
  hi("CursorLine",   { bg = "#2a2640" })
  hi("CursorLineNr", { fg = c.magenta, bg = "#2a2640", gui = "bold" })
  hi("LineNr",       { fg = c.bright_black, bg = c.bg })
  hi("Visual",       { bg = "#4b3f70" })
  hi("Search",       { fg = c.bg, bg = c.yellow, gui = "bold" })
  hi("IncSearch",    { fg = c.bg, bg = c.red, gui = "bold" })
  hi("Pmenu",        { fg = c.fg, bg = "#2a2640" })
  hi("PmenuSel",     { fg = c.bg, bg = c.magenta, gui = "bold" })
  hi("PmenuSbar",    { bg = "#3b3052" })
  hi("PmenuThumb",   { bg = c.magenta })

  -- Comments and identifiers
  hi("Comment",      { fg = c.bright_black, gui = "italic" })
  hi("Identifier",   { fg = c.magenta })
  hi("Function",     { fg = c.blue, gui = "bold" })
  hi("Statement",    { fg = c.red, gui = "bold" })
  hi("Constant",     { fg = c.cyan })
  hi("String",       { fg = c.green })
  hi("Type",         { fg = c.yellow, gui = "bold" })
  hi("Special",      { fg = c.magenta })

  -- Diagnostics (if using LSP)
  hi("DiagnosticError",   { fg = c.red })
  hi("DiagnosticWarn",    { fg = c.yellow })
  hi("DiagnosticInfo",    { fg = c.blue })
  hi("DiagnosticHint",    { fg = c.cyan })

  -- Git signs
  hi("GitGutterAdd",     { fg = c.green })
  hi("GitGutterChange",  { fg = c.yellow })
  hi("GitGutterDelete",  { fg = c.red })

  -- Statusline
  hi("StatusLine",       { fg = c.fg, bg = "#2a2640", gui = "bold" })
  hi("StatusLineNC",     { fg = c.bright_black, bg = c.bg })

  -- Cursor
  hi("Cursor",           { fg = c.bg, bg = c.magenta })

  -- More highlight groups can be added here as you want...

end

return M
