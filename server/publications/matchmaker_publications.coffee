Meteor.publish 'getMatchesNearby', (userId) ->
  # check(userId, String)
  # Now, return the updated list of the user's stories
  # stories = Stories.find
  #   userIds: {$elemMatch: userId}
  #   rejectedBy: {$size: 0} # Eliminate stories already rejected
  #   # newMatch: true

  # if stories.count < 10
  #   Meteor.call 'generateNewMatchesNearby', null, () ->
  #     # I don't care.
  stories = Stories.find()
  return stories