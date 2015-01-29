Meteor.publish 'storiesForUser', () ->
  # return Stories.find()
  return Stories.find({userIds: this.userId}, {sort: {updatedAt: 1}})

Meteor.publish 'storyForUser', (storyId) ->
  # check(id, String)
  return Stories.find({_id: storyId, userIds: this.userId})