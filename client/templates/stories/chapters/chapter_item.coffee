Template.chapterItem.helpers
  shouldDisplayNewVerseForm: () ->
    verseCount = _.size(this.verses)
    lastVerse = _.last(this.verses)
    if verseCount is 0 
      return true
    else if verseCount > 1
      return false
    else if lastVerse.author is Meteor.user()._id
      return false
    else
      return true
  isWaitingForResponse: () ->
    # return true
    return false if _.size(this.verses) > 1
    
    lastVerse = _.last(this.verses)
    if lastVerse.author is Meteor.user()._id
      return true
    else
      return false
