
-- Function to check if a colorscheme exists
local function colorscheme_exists(name)
    local success = pcall(vim.cmd, 'colorscheme ' .. name)
    return success
end

-- Desired colorscheme
local colorscheme = 'catppuccin'

local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
if catppuccin_ok then
    local palettes_ok, palettes = pcall(require, "catppuccin.palettes")
    local colors = palettes_ok and palettes.get_palette() or {}

    catppuccin.setup({
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
        custom_highlights = palettes_ok and {
            PanelHeading = { fg = colors.lavender, bold = true },
            IndentBlanklineContextChar = { fg = colors.overlay0 },
        } or {},
    })
end

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
vim.opt.cursorline = true

local bufferline_ok, bufferline = pcall(require, "bufferline")
if bufferline_ok then
    bufferline.setup{}
end
