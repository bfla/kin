Meteor.methods.getNearbyMatches = (latitude, longitude, distance) ->
  userId = Meteor.userId()

  # This doesn't actually use location yet.  
  # Since I'm starting in only Ann Arbor, I'll just pretend they're all nearby.
  # In the future, it should be more like this: 
  # http://docs.mongodb.org/manual/reference/operator/query/near/
  nearbyUsers = Meteor.users.find()

  _.each nearbyUsers, (nearbyUser) ->
    nearbyUserId = nearbyUser._id
    starter = Meteor.methods.getAndReturnRandomStarter(1)
    starterId = starter._id
    starterText = starter.text
    Meteor.methods.createStoryFromUsersAndStarter(userIds, starterId, starterText)