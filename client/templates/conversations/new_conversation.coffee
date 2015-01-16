Template.newConversation.created = () ->
  Session.set('startersIndex', 0) unless Session.get('startersIndex')

Template.newConversation.helpers
  latitude: () ->
     # returns a position object with coords: <Obj> and timestamp: <Date> and 
    position = Session.get('lastKnownLocation')
    if position
      coordinates = position.coords # should return {latitude: <>, longitude:<>, and more}
      return coordinates.latitude
    else
      return null
  longitude: () ->
    position = Session.get('lastKnownLocation') # returns a position object with coords: <Obj> and timestamp: <Date> and 
    if position
      coordinates = position.coords # should return {latitude: <>, longitude:<>, and more}
      return coordinates.longitude
    else
      return null
  dayOfWeek: () ->
    d = new Date()
    days = ['Sunday', 'Monday', 'Tuesday', 'Humpday', 'Thursday', 'Friday', 'Saturday']
    dayOfWeek = days[d.getDay()]
    return dayOfWeek
  # currentConversationStarters: () ->
  #   starters = Meteor.subscribe('starters')
  #   return starters
  currentLocation: () ->
    Tracker.autorun () ->
      position = Session.get('lastKnownLocation') # returns a position object with coords: <Obj> and timestamp: <Date> and 
      if position
        coordinates = position.coords # should return {latitude: <>, longitude:<>, and more}
        return coordinates
      else
        return null
    # return positionObj.loca
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



    
