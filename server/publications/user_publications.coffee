# Publish the user's profile information
#Meteor.publish 'userProfile'

# Meteor.publish 'matches', () ->
#   Meteor.users.find {status: active}

# Publish the user's gender in a 'userData' subscription
Meteor.publish "userData", (userId) ->
  data = Meteor.users.find {_id: userId}, {fields: {'services.facebook.gender': 1} }
  return data