Template.conversation.helpers
  messages: Meteor.subscribe 'conversation', {}
  messagesWithRank: ->
    return @messages.map (message, index, cursor) ->
      message._rank = index
      return message