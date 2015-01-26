Meteor.publish 'storiesForUser', () ->
  return Stories.find({userIds: {$elemMatch: this.userId}})

Meteor.publish 'storyItem', (storyId) ->
  check(id, String)
  return Stories.findOne(_id: storyId, {userIds: {$elemMatch: this.userId}})