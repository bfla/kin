Meteor.publish 'storiesForUser', () ->
  # return Stories.find()
  return Stories.find({userIds: this.userId}, {sort: {updatedAt: 1}})

Meteor.publish 'storyItemForUser', (storyId) ->
  check(id, String)
  return Stories.findOne({_id: storyId, userIds: this.userId})