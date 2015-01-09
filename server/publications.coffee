Meteor.publish 'conversation', (options) ->
  check options, {sort: Object, limit: Number}
  # return Messages.find({}, options)
  return Messages.find()