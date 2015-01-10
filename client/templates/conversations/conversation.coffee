Template.conversation.helpers
  verses: () ->
    options =
      sort: {'submittedAt':-1}
    verses = Verses.find({}, options)
    # verses = _.last(verses, [3])

  # verses: () ->
  #   options = 
  #     sort: {'submitted': -1}
  #     limit: 5
  #   verses = Meteor.subscribe('conversation', options)
  #   return verses
  # messages: Meteor.subscribe 'conversation', {}
  # messagesWithRank: ->
  #   return @messages.map (message, index, cursor) ->
  #     message._rank = index
  #     return message