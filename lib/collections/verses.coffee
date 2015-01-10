@Verses = new Mongo.Collection('verses')

@validateVerse = (verse) ->
  errors = {}
  # Don't allow empty verses.
  errors.noText = "You can't send a blank verse" if !verse.text or verse.text.length is 0
  return errors

Meteor.methods
  verseInsert: (verseAttributes) ->
    # check Meteor.userId().toString(), String
    check verseAttributes, {text: String}
    
    # Validate the verse
    errors = validateVerse(verseAttributes)

    # user = Meteor.user().find().limit(1)
    # receiver = user
    extendedAttributes = 
      # userId: user._id
      # author: user.username
      # sender: user._id # redundant but it's nice to have.
      # receiver: receiver._id
      submittedAt: new Date()

    verse = _.extend verseAttributes, extendedAttributes
    
    verseId = Verses.insert(verse)
    return _id: verseId