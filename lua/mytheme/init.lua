local vs = {}
local config = require('mytheme.config')
local theme = require('mytheme.theme')

-- Pass setup to config module
vs.setup = config.setup

-- Load colorscheme with a given or default style
---@param style? string
vs.load = function(style)
    vim.cmd('hi clear')
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    vim.o.termguicolors = true
    vim.g.colors_name = 'tyler-pugmire_vs'

    vim.o.background = style or config.opts.style or vim.o.background

    theme.set_highlights(config.opts)
    theme.link_highlight()

    if config.opts.group_overrides then
        for group, val in pairs(config.opts['group_overrides']) do
            vim.api.nvim_set_hl(0, group, val)
        end
    end
end

return vs