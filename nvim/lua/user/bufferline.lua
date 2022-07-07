local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    themable = true, -- whether or not the highlights for this plugin can be overriden.
    separator_style = "thick"
  }
}
--    show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon
--    show_close_icon = true | false,
--    show_tab_indicators = true | false,
--    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
--    -- can also be a table containing 2 custom separators
--    -- [focused and unfocused]. eg: { '|', '|' }
--    separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
--    enforce_regular_tabs = false | true,
--    always_show_bufferline = true | false,
--    sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
--      -- add custom logic
--      return buffer_a.modified > buffer_b.modified
--    end
--  }
--}

