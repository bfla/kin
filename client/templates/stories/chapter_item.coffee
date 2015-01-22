Template.chapterItem.helpers
  shouldDisplayNewVerseForm: () ->
    lastVerse = _.last(this.verses)
    return lastVerse.reader is Meteor.user()._id
