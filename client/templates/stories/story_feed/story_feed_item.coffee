Template.storyFeedItem.helpers
  story: () ->
    return this
  verseText: () ->
    chapters = this.chapters
    verseSets = _.pluck(chapters, 'verses')
    verses = _.flatten(verseSets)
    lastVerse = _.last(verses)
    verseText = lastVerse.text
    return verseText