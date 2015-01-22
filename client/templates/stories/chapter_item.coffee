Template.chapterItem.helpers
  shouldDisplayNewVerseForm: () ->
    lastVerse = _.last(this.verses)
    console.log lastVerse.reader is Meteor.user()._id
    return lastVerse.reader is Meteor.user()._id
