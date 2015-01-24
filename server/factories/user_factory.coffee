# Configure Facebook credentials
Factory.define 'user', Meteor.users,
  createdAt: new Date()
  profile:
    name: "Brian Flaherty"
  services:
    facebook:
      accessToken: "CAAIoZAP70gQYBADTuxOKzTYZAgQF55CaGEBITEvGTLJOrspVF2MNCawcJy1gRJVnyd7A5ZBBmshi1DzUPJm75DQNJ8zyfb5f0IbZC0v6Sr13zZC1H220XO7bTqQSg8waL1SKOnoitswSjll86ZCAyeyqZAr5kdS3znnQPZBbPV7QZAbaZBGSvm01Ws3l5aO2c3mfJXIhhOoyB4vsHZBYk4NJB8ZC"
      expiresAt: 1426095976050
      id: "10104724427825583"
      email: "bfla@umich.edu"
      name: "Brian Flaherty"
      first_name: "Brian"
      last_name: "Flaherty"
      link: "https://www.facebook.com/app_scoped_user_id/10104724427825583/"
      gender: "male"
      locale: "en_US"
    resume:
      loginTokens: [
        when: new Date()
        hashedToken: "v5btdQ1eH1cfihVPt3BsXaaKr2FVUZdXr8G2sQ47zq4="
      ]

Factory.define 'otherUser', Meteor.users,
  createdAt: new Date()
  profile:
    name: "Lou Salome"
  services:
    facebook:
      accessToken: "CAAIoZAP70gQYBAL9zMFJpqmqZBPrW0ZAyIMkNhSXtjmTjrpXGrJpHYvf4uXDD15fMyodiqMRZAHzQX2ZBxJtmlp0JXI61Aselt1gLWlGoN611wSoAuZBQbZBMwOM2mwJGDVZAZCsNTm6YBJZBFJHutCZBDgsOywuH4RBuBdNAZCMidQJD7CrCCcJQClsYngGwAAr6gdIZAKmoEDqiTluYMI7b5l82"
      expiresAt: 1426096995822
      id: "1617711891785708"
      email: "brian@getcamphero.com"
      name: "Lou Salome"
      first_name: "Lou"
      last_name: "Salome"
      link: "https://www.facebook.com/app_scoped_user_id/1617711891785708/"
      gender: "female"
      locale: "en_US"
    resume:
      loginTokens: [
        when: new Date()
        hashedToken: "FsZmlgxV7OhjUuk4JuO1O9mW6Y3Blrg/4YEF3QzVzWc="
      ]

@seedUsers = () ->
  Factory.create('user')
  Factory.create('otherUser')
  if Meteor.users.count < 2 then console.log "Error: User factory failed to create users"

@buildUser = () ->
  Factory.build('user')

@getUserFactory = () ->
  Factory.get('user')

@buildOtherUser = () ->
  Factory.build('otherUser')

@getOtherUserFactory = () ->
  Factory.get('otherUser')

# # Build a verse for the story factory
# verse = {}
# verse.author = Factory.get('otherUser')._id
# verse.reader = Factory.get('user')._id
# verse.gender = "female"
# verse.text = "Yes.  Plutocracy is the only system worth considering."
# verse.createdAt = new Date()

# verseIsValid = Schema.Verse.namedContext().validate(verse)
# console.log "Error: Verse fixture is invalid" unless verseIsValid

# # Build a chapter for the story factory
# chapter = {}
# chapter.createdAt = new Date()
# chapter.updatedAt = new Date()
# chapter.starter = Factory.get('starter')
# chapter.verses = [verse]

# chapterIsValid = Schema.Chapter.namedContext().validate(chapter)
# console.log "Error: Chapter fixture is invalid" unless chapterIsValid

# Factory.define 'story', Stories,
#   userIds: [Factory.get('user'), Factory.get('otherUser')]
#   checkedBy: []
#   rejectedBy: []
#   newMatch: true
#   usersAreKin: false
#   createdAt: new Date()
#   updatedAt: new Date()
#   latestChapterAddedAt: new Date()
#   latestStarterAddedAt: new Date()
#   chapters: [chapter]

# @seedStories = () ->
#   Factory.create('story')


