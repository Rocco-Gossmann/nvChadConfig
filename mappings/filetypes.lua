return {
  ["markdown"] = {
    n = {
      ["qt"] = {
        'mz',	-- mark location
        '0:s/^\\(\\s*\\)\\(\\[.\\] \\)*/\\1/<CR>', -- remove checkbox in the bebinning
        '0:s/^\\(\\s*\\)\\(\\~\\~\\)*\\(.\\{-\\}\\)\\(\\~\\~\\)*$/\\1\\3/<CR>', -- remove Strike
        '^i[ ] <ESC>',						 -- place empty checkbox
        '`z', -- reset cursor to location
      },

      ["qd"] = {
        'mz',	-- mark location
        '0:s/^\\(\\s*\\)\\(\\[.\\] \\)*/\\1/<CR>', -- remove checkbox in the bebinning
        '0:s/^\\(\\s*\\)\\(\\~\\~\\)*\\(.\\{-\\}\\)\\(\\~\\~\\)*$/\\1\\3/<CR>', -- remove Strike
        '^i[x] <ESC>',						       -- place checked checkbox
        '`z', -- reset cursor to location
      },

      ["qc"] = {
        'mz',	-- mark location
        '0:s/^\\(\\s*\\)\\(\\[.\\] \\)*/\\1/<CR>', -- remove checkbox in the bebinning
        '0:s/^\\(\\s*\\)\\(\\~\\~\\)*\\(.\\{-\\}\\)\\(\\~\\~\\)*$/\\1\\3/<CR>', -- remove Strike
        '^i~~<ESC>A~~<ESC>',					   -- surround in strike
        '`z', -- reset cursor to location
      },

      ["qx"] = {
        'mz',	-- mark location
        '0:s/^\\(\\s*\\)\\(\\[.\\] \\)*/\\1/<CR>', -- remove checkbox in the bebinning
        '0:s/^\\(\\s*\\)\\(\\~\\~\\)*\\(.\\{-\\}\\)\\(\\~\\~\\)*$/\\1\\3/<CR>', -- remove Strike
        '`z', -- reset cursor to location
      },
    },
  },
}
