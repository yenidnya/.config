require('orgmode').setup({
    org_agenda_files = { '~/Org/*' },
    org_default_notes_file = '~/Org/Notes.org',
    org_todo_keywords = { 'TODO(t)', 'NEXT', "CR", 'DONE', "WAIT" },
    org_indent_mode = 'noindent',
    org_todo_keyword_faces = {
        NEXT = ':foreground #7cafc2',
        CR = ':foreground #f8f8f8',
        DONE = ':foreground #5fd963 :weight bold',
        WAIT = ":foreground #f7ca88"
    },
    org_hide_leading_stars = true,
    mappings = {
        org = {
            org_todo = "<leader>to",
        }
    }
})
