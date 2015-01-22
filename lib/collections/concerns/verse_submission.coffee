Meteor.methods 
  addVerseToStoryAndUpdateStory: (params) ->
    user = Meteor.user()
    # Validate that the story exists and the user is a part to it.
    # story = Stories.findOne(params.storyId, userIds: {$elemMatch: user._id} })
    story = Stories.findOne(params.storyId)
    targetChapter = _.last(story.chapters)

    # Construct the verse
    verse = {}
    verse.author = user._id
    verse.reader = _.without(story.userIds, [user._id])[0]
    if Meteor.isServer
      verse.gender = user.services.facebook.gender
    verse.createdAt = new Date()
    verse.text = params.verseText
    
    # Add the verse to the last chapter on the story
    i = _.size(story.chapters) - 1
    story.chapters[i].verses.push(verse)
    
    # If it's time to start a new chapter, then create it...
    if _.size(story.chapters[i].verses) > 1
      newChapter = _generateNewChapterWithRandomStarter()
      story.chapters.push(newChapter)

    # Save the edits to the database
    Stories.update({_id: story._id}, {$set: {chapters: story.chapters} })

    # Stories.update({_id: storyId}, {chapters: {position: i} })

_generateNewChapterWithRandomStarter = () ->
  chapter = {}
  chapter.createdAt = new Date()
  chapter.updatedAt = new Date()
  chapter.starter = getRandomStarterWithLevel(1)
  console.log "chapter.starter is " + chapter.starter
  chapter.verses = []
  return chapter

