Meteor.publish 'getMatchesNearby', () ->
  Matchmaker.getMatchesNearbyAndReturnStories

  # return Stories.find(lat, lng)
  # return Matchmaker.getMatchesNearbyAndReturnStories(lat, lng)