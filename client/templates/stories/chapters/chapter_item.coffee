Template.chapterItem.helpers
  shouldDisplayNewVerseForm: () ->
    lastVerse = _.last(this.verses)
    if _.size(this.verses) > 1
      return false
    else if lastVerse.reader is Meteor.user()._id
      return true
    else return false 
