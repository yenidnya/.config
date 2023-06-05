local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        path_display = { 'smart' },
        mappings = {
            i = {
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            }
        }
    },
    layout_config = {
        horizontal = {
            preview_cutoff = 100,
            preview_width = 0.6
        }
    }
}
