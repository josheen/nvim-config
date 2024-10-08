-- Function to check if a colorscheme exists
local function colorscheme_exists(name)
    local success = pcall(vim.cmd, 'colorscheme ' .. name)
    return success
end

-- Desired colorscheme
local colorscheme = 'catppuccin'

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
