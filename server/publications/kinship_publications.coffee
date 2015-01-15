# Publish all of the kinships for the user
# If it starts producing too much load on the database, we'll need to prune this down somehow...
Meteor.publish 'kinshipsForUser', ->
  return Kinships.find({userId: Meteor.userId})