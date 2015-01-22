# @Matchmaker = {}

Meteor.methods.generateNewMatchesNearby = () ->
  console.log 'Loose Seal'
  userId = Meteor.userId()
  # redFlag
  # This doesn't actually use location yet.  
  # Since I'm starting in only Ann Arbor, I'll just pretend they're all nearby.
  # In the future, it should be more like this: 
  # http://docs.mongodb.org/manual/reference/operator/query/near/

  console.log 'Teamacil'
  nearbyUserIds = _getIdsOfOtherUsersInArea(userId) # Get array of Ids for other users in the area

  storiesForCurrentUser = Stories.find({userIds: {$elemMatch: userId }}) # First, let's get existing stories for the current user
  if storiesForCurrentUser # Filter out any users with whom the user already has been matched.
    newMatchingUserIds = _identifyUsersWhoAreNewMatches(userId, nearbyUserIds, storiesForCurrentUser)
  else
    newMatchingUserIds = nearbyUserIds

  # Now we're going to create stories between this user and nearby users
  console.log "Ahn Yang"
  _.each newMatchingUserIds, (nearbyUserId) ->
    _buildStoryForMatch(nearbyUserId)

  console.log "Stories:" + stories
  return stories

_buildStoryForMatch = (matchingUserId) ->
  console.log "Money in the banana stand"
  starter = Meteor.methods.getAndReturnRandomStarter(1)
  starterId = starter._id
  starterText = starter.text
  Meteor.methods.createStoryFromUsersAndStarter(userIds, starterId, starterText)

_identifyUsersWhoAreNewMatches = (userId, nearbyUserIds, storiesForCurrentUser) ->
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

# redFlag - this should actually use latitude and longitude in the future
_getIdsOfOtherUsersInArea = (userId) ->
  checkins = Checkins.find() # Get checkins nearby
  nearbyUserIds = _.pluck checkins 'userId' # Get the userIds associated with nearby checkins
  nearbyUserIds = _.remove checkins, (id) -> # Remove the current user from the list
    id = userId
  return nearbyUserIds