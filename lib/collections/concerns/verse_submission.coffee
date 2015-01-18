Meteor.methods.verseSubmit = (verseText, storyId) ->
  userId = Meteor.userId()
  Meteor.methods.addVerseToStoryAndUpdateStory(storyId, userId, verseText)