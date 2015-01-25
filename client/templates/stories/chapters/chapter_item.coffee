Template.chapterItem.helpers
  shouldDisplayNewVerseForm: () ->
    verseCount = _.size(this.verses)
    lastVerse = _.last(this.verses)
    user = Meteor.user()
    if user
      userId = user._id
    if verseCount is 0 
      return true
    else if verseCount > 1
      return false
    else if  userId && lastVerse.author is userId
      return false
    else
      return true
  isWaitingForResponse: () ->
    # return true
    return false if _.size(this.verses) > 1
    
    lastVerse = _.last(this.verses)
    user = Meteor.user()
    if user
      userId = user._id
    if lastVerse.author is userId
      return true
    else
      return false
