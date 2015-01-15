# Publish all possible conversation starters
# If the app scales, we'll need to do something about this...
Meteor.publish 'starters', ->
  return Starters.find()