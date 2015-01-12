Template.newConversation.created = () ->
  Session.set('startersIndex', 0) unless Session.get('startersIndex')

Template.newConversation.helpers
  dayOfWeek: () ->
    d = new Date()
    days = ['Sunday', 'Monday', 'Tuesday', 'Humpday', 'Thursday', 'Friday', 'Saturday']
    dayOfWeek = days[d.getDay()]
    return dayOfWeek
  currentConversationStarters: () ->
    starters = Starters.find({}, {limit: 4})

  # shouldShowPrevChevron: () ->
  #   i = Session.get('startersIndex')
  #   return true unless (i - 4 < 0)

  # shouldShowNextChevron: () ->
  #   i = Session.get('startersIndex')
  #   return true

  # nextConversationStarters: () ->
  #   i = Session.get('startersIndex')
  #   Session.set('startersIndex', i+4)

  # prevConversationStarters: () ->
  #   i = Session.get('startersIndex')
  #   Session.set('startersIndex', i-4)

# Template.newConversation.events
#   'click .next-starters-trigger': () ->
#     nextConversationStarters()
#   'click .prev-starters-trigger': () ->
#     prevConversationStarters()



    
