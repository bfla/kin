@Kinships = new Mongo.Collection('kinships')

# @Kinships.allow
#   addVerseToKinship: (userId, kinship) ->
#     return ownsDocument(userId, post)
#   remove: (userId, kinship) ->
#     return ownsDocument(userId, post)

validateKinship = (kinship) ->
  errors = {}
  # Require 2 users
  errors.requiresTwoUsers = "A kinship must have 2 users" unless kinship.userIds.length is 2
  return errors

Meteor.methods
  kinshipInsert: (kinshipAttributes) ->
    check kinshipAttributes, {userIds: Array}
    # check kinshipAttributes, {users[0]: Object}
    # check kinshipAttributes, {users[1]: Object}

    # Validate the kinship
    errors = validateKinship(kinshipAttributes)

    extendedAttributes = 
      usersWhoLike: []
      usersWhoDislike: []
      areFriends: false
      updatedAt: new Date()
      createdAt: new Date()

    if kinshipAttributes.activeTopicId
      extendedAttributes.activeTopic = kinshipAttributes.activeTopicId

    kinship = _.extend kinshipAttributes, extendedAttributes
    
    kinshipId = Kinships.insert(kinship)
    return _id: kinshipId

  addVerseToKinship: (kinshipId, verseId) ->
    check kinshipId, String
    check verseId, String
    Kinships.update({ _id: kinshipId}, {$push: {verses: verseId}})

  addLikeToKinship: (kinshipId) ->
    userId = Meteor.user()
    Kinships.update( {_id: kinshipId}, {$push: {usersWhoLike: userId}})

  addDislikeToKinship: () ->
    userId = Meteor.user()
    Kinships.update( {_id: kinshipId}, {$push: {usersWhoDislike: userId}})