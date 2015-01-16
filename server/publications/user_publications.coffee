# Publish the user's profile information
#Meteor.publish 'userProfile'

Meteor.publish 'matches', () ->
  Meteor.users.find {status: active}
