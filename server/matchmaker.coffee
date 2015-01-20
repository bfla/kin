@Matchmaker = {}

Matchmaker.getMatchesNearbyAndReturnStories = () ->
  userId = Meteor.user()
  # redFlag
  # This doesn't actually use location yet.  
  # Since I'm starting in only Ann Arbor, I'll just pretend they're all nearby.
  # In the future, it should be more like this: 
  # http://docs.mongodb.org/manual/reference/operator/query/near/

  checkins = Checkins.find() # Get checkins nearby
  nearbyUserIds = _.pluck checkins 'userId' # Get the userIds associated with nearby checkins
  nearbyUserIds = _.remove checkins, (id) -> # Remove the current user from the list
    id = userId

  storiesForCurrentUser = Stories.find({userIds: {$elemMatch: userId }}) # First, let's get existing stories for the current user
  newMatchingUserIds = identifyUsersWhoAreNewMatches(nearbyUserIds, storiesForCurrentUser)

  # Now we're going to create stories between this user and nearby users
  _.each newMatchingUserIds, (nearbyUserId) ->
    buildStoryForMatch(nearbyUserId)
  
  console.log "I made it."
  # Now, return the updated list of the user's stories
  stories = Stories.find
    userIds: {$elemMatch: userId}
    newMatch: true
    rejectedBy: {$size: 0} # Elimiante stories already rejected

  console.log "Stories:" + stories
  return stories

buildStoryForMatch = (matchingUser) ->
  console.log "Money in the banana stand"
  starter = Meteor.methods.getAndReturnRandomStarter(1)
  starterId = starter._id
  starterText = starter.text
  Meteor.methods.createStoryFromUsersAndStarter(userIds, starterId, starterText)

identifyUsersWhoAreNewMatches = (nearbyUserIds, storiesForCurrentUser) ->
  # Let's make sure that the user doesn't already have a story with someone before we create a new story
  usersAlreadyAssociated = []
  userPairs = _.pluck storiesForCurrentUser, 'userIds' # Each item in the array should have a pair of users
  
  # Identify the other user (who is not the current user)
  _.each userPairs, (pair) ->
    otherUser = _.reject pair, (id) ->
      id is userId
    usersAlreadyAssociated.push(otherUser)

  # Get a list of users with whom the current user does not already have a story
  newMatchingUserIds = _.difference(nearbyUserIds, usersAlreadyAssociated) 
  return newMatchingUserIds