# Let's explain what this story model is about...
# A story is a conversation between 2 users.
# It contains chapters.  Each chapter is a question and the users' answers to that question.
# Each user's answer to a question is a verse.

@Stories = new Mongo.Collection('stories')
Stories.attachSchema(Schema.Story) # Validate the Story against our schema

Stories.allow
  update: (userId, story) -> return userIsAnOwnerOfDocument(userId, story)

# redFlag - this should whitelist which paramters a user can and cannot update...

# This method takes two userIds, a storyId, and a starterId to create a new chapter in a story.
# A chapter contains a conversation starter and any answers for that conversation starter.
_addChapterToStoryAndReturnStory = (storyObj, starterId, starterText) ->
  newChapter = {}
  newChapter.starterId = starterId
  newChapter.starterText = starterText
  newChapter.verses = []
  newChapter.createdAt = new Date()
  newChapter.updatedAt = new Date()

Meteor.methods
  addVerseToStoryAndUpdateStory: (params) ->
    user = Meteor.user()
    # Validate that the story exists and the user is a part to it.
    # story = Stories.findOne(params.storyId, userIds: {$elemMatch: user._id} })
    story = Stories.findOne(params.storyId)
    console.log "Story:" + story

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
    # Save the edits to the database
    Stories.update({_id: story._id}, {$set: {chapters: story.chapters} })

    # Stories.update({_id: storyId}, {chapters: {position: i} })

  # params: userIds, starterId, starterText
  createStoryFromUsersAndStarter = (params) ->
    newStory =
      userIds: params.userIds
      chapters: []
      checkedBy: []
      rejectedBy: []
      usersAreKin: false
      newMatch: true
      createdAt: new Date()
      updatedAt: new Date()
      # To make it easy to order our stories, let's track when things are added.
      latestChapterAddedAt: new Date()
      latestStarterAddedAt: new Date()
      latestVerseAddedAt: null

    newStory = _addChapterToStoryAndReturnStory(newStory, params.starterId, params.starterText)
    
    Stories.insert newStory, (err, status) ->
      if err
        err.invalidKeys
      else
        return status 



    