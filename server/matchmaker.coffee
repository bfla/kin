@Matchmaker = {}

Matchmaker.getMatchesNearbyAndReturnStories = () ->
  userId = Meteor.userId()

  nearbyUsers = Meteor.subscribe('nearbyUsers', latitude, longitude, distance)
  # redFlag
  # This doesn't actually use location yet.  
  # Since I'm starting in only Ann Arbor, I'll just pretend they're all nearby.
  # In the future, it should be more like this: 
  # http://docs.mongodb.org/manual/reference/operator/query/near/

  # For each nearby user...
  _.each nearbyUsers, (nearbyUser) ->
    # Check if these 2 users already share a story
    nearbyUserId = nearbyUser._id

Matchmaker.buildAndReturnStoryForMatch = () ->
    starter = Meteor.methods.getAndReturnRandomStarter(1)
    starterId = starter._id
    starterText = starter.text
    Meteor.methods.createStoryFromUsersAndStarter(userIds, starterId, starterText)