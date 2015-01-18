# Let's explain what this story model is about...
# A story is a conversation between 2 users.
# It contains chapters.  Each chapter is a question and the users' answers to that question.
# Each user's answer to a question is a verse.

@Stories = new Mongo.Collection('stories')
Stories.attachSchema(Schema.Story) # Validate the Story against our schema

Meteor.methods.createStoryFromUsersAndStarter = (userIds, starterId, starterText) ->
    # check options.users[0], String
    # check storyAttributes.users[1] String
  
  newStory =
    userIds: userIds
    chapters: []
    checkedBy: []
    rejectedBy: []
    usersAreKin: false
    createdAt: new Date()
    updatedAt: new Date()
    # To make it easy to order our stories, let's track when things are added.
    latestChapterAddedAt: new Date()
    latestStarterAddedAt: new Date()
    latestVerseAddedAt: null

  newStory = _addChapterToStoryAndReturnStory(newStory, starterId, starterText)
  
  Stories.insert newStory, (err, status) ->
    if err
      err.invalidKeys
    else
      return status 

# This method takes two userIds, a storyId, and a starterId to create a new chapter in a story.
# A chapter contains a conversation starter and any answers for that conversation starter.
_addChapterToStoryAndReturnStory = (storyObj, starterId, starterText) ->
  newChapter = {}
  newChapter.starterId = starterId
  newChapter.starterText = starterText
  newChapter.verses = []
  newChapter.createdAt = new Date()
  newChapter.updatedAt = new Date()

# This method should add a verse to a story given a userId and text
_addVerseToStoryAndReturnStory = (storyId, userId, textContent) ->
  validateVerse(textContent)
  newVerse = {}
  newVerse.textContent = textContent
  newVerse.createdAt = new Date()
  newVerse.updatedAt = new Date()

  story = Stories.find({_id: storyId})

Meteor.methods.addVerseToStoryAndUpdateStory = (storyId, userId, textContent) ->
  story = Stories.find({_id: storyId, userIds: {$elemMatch: userId} })
  story = _addVerseToStoryAndReturnStory(storyId, userId, textContent)



    