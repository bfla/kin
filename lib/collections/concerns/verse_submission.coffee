Meteor.methods.verseSubmit = (verseText, storyId) ->
  userId = Meteor.userId()
  # Meteor.call 'addVerseToStoryAndUpdateStory', (storyId, userId, verseText)