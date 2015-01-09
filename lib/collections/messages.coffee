@Messages = new Mongo.Collection('messages')

@validateMessage = (message) ->
  errors = {}
  # Don't allow empty messages.
  errors.text = "You can't send a blank message" if !message.text or message.text.length is 0
  return errors

Meteor.methods
  messageInsert: (messageAttributes) ->
    check @userId, String
    check messageAttributes, {text: String}
    
    errors = validatePost(messageAttributes)
    if errors.text
      throw new Meteor.Error('invalid-message', "You can't send a blank message")
    
    user = Meteor.user()
    receiver = Meteor.user()
    extendedAttributes = 
      userId: user._id
      author: user.username
      receiver: receiver._id
      submitted: new Date()

    message = _.extend messageAttributes, extendedAttributes
    
    messageId = Messages.insert(message)
    return _id: messageId