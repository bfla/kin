Meteor.publish 'getMatchesNearby', () ->
  matches = Matchmaker.getMatchesNearbyAndReturnStories
  console.log matches
  return matches