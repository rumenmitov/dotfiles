require('better-comment').Setup({
  -- TODO hi
  -- NOTE bye
  -- IMPORTANT hello
  tags = {
    {
      name = "TODO",
      fg = "lime",
      bg = "",
      bold = false,
      virtual_text = "🟢",
    },
    {
      name = "NOTE",
      fg = "white",
      bg = "",
      bold = true,
      virtual_text = "🔵",
    },
    {
      name = "IMPORTANT",
      fg = "white",
      bg = "red",
      bold = true,
      virtual_text = "🔴",
    },

  }
})

