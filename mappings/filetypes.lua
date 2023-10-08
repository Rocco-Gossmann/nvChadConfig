return {
  ["markdown"] = {
    n = {
	-- Convert Line to Task
      ["qt"] = {
        'mz',	-- mark location
        '0:s/^\\(\\s*\\)\\(\\[.\\] \\)*/\\1/<CR>', -- remove checkbox in the bebinning
        '0:s/^\\(\\s*\\)\\(\\~\\~\\)*\\(.\\{-\\}\\)\\(\\~\\~\\)*$/\\1\\3/<CR>', -- remove Strike
        '^i[ ] <ESC>',						 -- place empty checkbox
        '`z', -- reset cursor to location
      },

	-- Convert Line to Done Task
      ["qd"] = {
        'mz',	-- mark location
        '0:s/^\\(\\s*\\)\\(\\[.\\] \\)*/\\1/<CR>', -- remove checkbox in the bebinning
        '0:s/^\\(\\s*\\)\\(\\~\\~\\)*\\(.\\{-\\}\\)\\(\\~\\~\\)*$/\\1\\3/<CR>', -- remove Strike
        '^i[x] <ESC>',						       -- place checked checkbox
        '`z', -- reset cursor to location
      },

	-- Convert Line to Canceled Task
      ["qc"] = {
        'mz',	-- mark location
        '0:s/^\\(\\s*\\)\\(\\[.\\] \\)*/\\1/<CR>', -- remove checkbox in the bebinning
        '0:s/^\\(\\s*\\)\\(\\~\\~\\)*\\(.\\{-\\}\\)\\(\\~\\~\\)*$/\\1\\3/<CR>', -- remove Strike
        '^i~~<ESC>A~~<ESC>',					   -- surround in strike
        '`z', -- reset cursor to location
      },

	-- Remove Task Checkbox
      ["qx"] = {
        'mz',	-- mark location
        '0:s/^\\(\\s*\\)\\(\\[.\\] \\)*/\\1/<CR>', -- remove checkbox in the bebinning
        '0:s/^\\(\\s*\\)\\(\\~\\~\\)*\\(.\\{-\\}\\)\\(\\~\\~\\)*$/\\1\\3/<CR>', -- remove Strike
        '`z', -- reset cursor to location
      },
    },
  },
}
