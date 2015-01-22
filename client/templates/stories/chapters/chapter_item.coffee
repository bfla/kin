Template.chapterItem.helpers
  shouldDisplayNewVerseForm: () ->
    if _.size(this.verses) > 1
      return false
    else if lastVerse.reader is Meteor.user()._id
      return true
    else return false 
