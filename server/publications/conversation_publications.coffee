Meteor.publish 'conversation', (options) ->
  check options, {sort: Object, limit: Number}
  return Verses.find({}, options)