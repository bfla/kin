# Publish the user's profile information
#Meteor.publish 'userProfile'

# Meteor.publish 'matches', () ->
#   Meteor.users.find {status: active}

# Publish the user's gender in a 'userData' subscription
# redFlag - this is busted.
# Meteor.publish "userData", (userId) ->
#   fields = {}
#   fields =
#     services: 1
#     'services.facebook': 1
#     'services.facebook.gender': 1


#   data = Meteor.users.find {_id: userId}, {fields: fields}
#   console.log "data: " + JSON.stringify(data)
#   return data