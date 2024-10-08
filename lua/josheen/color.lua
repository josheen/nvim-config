-- Function to check if a colorscheme exists
local function colorscheme_exists(name)
    local success = pcall(vim.cmd, 'colorscheme ' .. name)
    return success
end

-- Desired colorscheme
local colorscheme = 'catppuccin'

local colors = require("catppuccin.palettes").get_palette()

require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    styles = {
        functions = { "italic" },
        keywords = { "bold" },
    },
    integrations = {
        nvimtree = true,
        mason = true,
    },
    custom_highlights = {
        PanelHeading = { fg = colors.lavender, bold = true },
        IndentBlanklineContextChar = { fg = colors.overlay0 },
    },
})

-- Check if the colorscheme exists before setting it
if colorscheme_exists(colorscheme) then
    vim.cmd('colorscheme ' .. colorscheme)
else
    vim.cmd('colorscheme peaksea')
end

vim.opt.background = "dark"
vim.cmd([[
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
]])
