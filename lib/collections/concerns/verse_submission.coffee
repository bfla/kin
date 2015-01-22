Meteor.methods.verseSubmit = (verseText, storyId) ->
  userId = Meteor.userId()
  # Unfortunately, I think this requires 2 queries.  
  # We need to know about the structure of the story before we know where to insert stuff...
  story = Story.find({_id: storyId})
  receivingUser = _.difference(story.userIds, [userId])[0]
  chaptersCount = story.chapters.count()
  targetChapter = story.chapters[chaptersCount]
  versesCount = targetChapter.verses.count()

  # If the operation succeeds and chapter has 2 veerses, then add a new starter and send it back.
  if versesCount > 0
    createNewChapterForStory(storyId)

  Story.update({_id: storyId}, {chapters: updatedChapters})
  # Meteor.call 'addVerseToStoryAndUpdateStory', (storyId, userId, verseText)