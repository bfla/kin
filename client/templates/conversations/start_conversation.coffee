Template.startConversation.helpers
  dayOfWeek: () ->
    d = new Date()
    days = ['Sunday', 'Monday', 'Tuesday', 'Humpday', 'Thursday', 'Friday', 'Saturday']
    dayOfWeek = days[d.getDay()]
    return dayOfWeek
  featuredConversationStarters: () ->
    starters = [
      {text: "Should prosecutors press charges against General Patreus?", typology:"guardians", topic:"happenings"}
      {text: "What's the best place you've ever travelled to?", typology:"explorers", topic:"experiences"}
      {text: "Have you ever experienced Eudomonia (feeling happy and melancholy at the same time)?", typology:"dreamers", topic:'reality'}
      {text: "Is capitalism merely a form indentured servitude? What might be a better system?", typology:"analysts", topic:'ideas'}
      # {text: "Should prosecutors press charges against General Patreus?", typology:"guardians", topic:"happenings"}
      # {text: "Describe in detail the best orgasm you've ever had", typology:"explorers", topic:"experiences"}
      # {text: "Radiohead lyrics. Discuss.", typology:"dreamers", topic:'reality'}
      # {text: "What are the merits and tradeoffs of humanistic athiesm versus other belief systems?", typology:"analysts", topic:'ideas'}
      # {text: "Should prosecutors press charges against General Patreus?", typology:"guardians", topic:"happenings"}
      # {text: "Describe in detail the best orgasm you've ever had", typology:"explorers", topic:"experiences"}
      # {text: "Is life in modern America completely meaningless?", typology:"dreamers", topic:'reality'}
      # {text: "Is free will real? Should we care?", typology:"analysts", topic:'ideas'}
    ]
    return starters
