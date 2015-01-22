# Publish all possible conversation starters
# If the app scales, we'll need to do something about this...
Meteor.publish 'starters', (connectionLevel)->
  return Starters.find({connectionLevel: connectionLevel})