# Fixture data 
if Meteor.users.find().count() is 0
  now = new Date().getTime()
  
  # Configure Facebook credentials
  ServiceConfiguration.configurations.insert
    service : "facebook"
    appId: Meteor.settings.facebook.appId
    secret: Meteor.settings.facebook.secret

  # Configure facebook
  brianId = Meteor.users.insert
    # _id: "gCYke7d3rBhYSxndr"
    createdAt: now
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
          # when: now #ISODate("2015-01-10T17:46:16.242Z")
          when: new Date()
          hashedToken: "v5btdQ1eH1cfihVPt3BsXaaKr2FVUZdXr8G2sQ47zq4="
        ]
  brian = Meteor.users.findOne(brianId)  

  # create two users
  # brianId = Meteor.users.insert(profile:
  #   name: "Brian"
  # )
  platoId = Meteor.users.insert
    # _id: "rjEwi8HCLGnwC3NHJ"
    createdAt: new Date() #ISODate("2015-01-10T18:03:16.962Z")
    profile:
      name: "Plato Flaherty"

    services:
      facebook:
        accessToken: "CAAIoZAP70gQYBAL9zMFJpqmqZBPrW0ZAyIMkNhSXtjmTjrpXGrJpHYvf4uXDD15fMyodiqMRZAHzQX2ZBxJtmlp0JXI61Aselt1gLWlGoN611wSoAuZBQbZBMwOM2mwJGDVZAZCsNTm6YBJZBFJHutCZBDgsOywuH4RBuBdNAZCMidQJD7CrCCcJQClsYngGwAAr6gdIZAKmoEDqiTluYMI7b5l82"
        expiresAt: 1426096995822
        id: "1617711891785708"
        email: "brian@getcamphero.com"
        name: "Plato Flaherty"
        first_name: "Plato"
        last_name: "Flaherty"
        link: "https://www.facebook.com/app_scoped_user_id/1617711891785708/"
        gender: "male"
        locale: "en_US"

      resume:
        loginTokens: [
          # when: now
          # when: ISODate("2015-01-10T18:03:16.970Z")
          when: new Date()
          hashedToken: "FsZmlgxV7OhjUuk4JuO1O9mW6Y3Blrg/4YEF3QzVzWc="
        ]

  if Meteor.users.find().count < 2
    console.log "Failed to add fixture users. Update da fixtures."
  
  # platoId = Meteor.users.insert(profile:
  #   name: "Plato"
  # )
  plato = Meteor.users.findOne(platoId)

  brianCheckinId = Checkins.insert
    userId: brianId
    createdAt: new Date()
    updatedAt: new Date()
    geojson:
      type: "Feature"
      geometry:
        type: "Point"
        coordinates: [42.2814, -83.7483]

  platoCheckinId = Checkins.insert
    userId: platoId
    createdAt: new Date()
    updatedAt: new Date()
    geojson:
      type: "Feature"
      geometry:
        type: "Point"
        coordinates: [42.2815, -83.7484]

  if Checkins.find().count < 2
    console.log "Failed to add fixture checkins. Update da fixtures."
  # salomeId = Meteor.users.insert

  #   createdAt: new Date()
  #   profile:
  #     name: "Lou Salome"

  #   services:
  #     facebook:
  #       accessToken: "CAAIoZAP70gQYBAL9zMFJpqmqZBPrW0ZAyIMkNhSXtjmTjrpXGrJpHYvf4uXDD15fMyodiqMRZAHzQX2ZBxJtmlp0JXI61Aselt1gLWlGoN611wSoAuZBQbZBMwOM2mwJGDVZAZCsNTm6YBJZBFJHutCZBDgsOywuH4RBuBdNAZCMidQJD7CrCCcJQClsYngGwAAr6gdIZAKmoEDqiTluYMI7b5l82"
  #       expiresAt: 1426096995822
  #       id: "1617711891785708"
  #       email: "brianflaherty64@gmail.com"
  #       name: "Lou Salome"
  #       first_name: "Lou"
  #       last_name: "Salome"
  #       link: "https://www.facebook.com/app_scoped_user_id/1617711891785708/"
  #       gender: "female"
  #       locale: "en_US"

  #     resume:
  #       loginTokens: [
  #         when: now
  #         # when: ISODate("2015-01-10T18:03:16.970Z")
  #         hashedToken: "FsZmlgxV7OhjUuk4JuO1O9mW6Y3Blrg/4YEF3QzVzWc="
  #       ]


  
  # If we need related models/docs, we can follow this pattern...

  # telescopeId = Posts.insert(
  #   text: "Introducing Telescope"
  #   userId: plato._id
  #   author: plato.profile.name
  #   url: "http://platogreif.com/introducing-telescope/"
  #   submitted: new Date(now - 7 * 3600 * 1000)
  #   commentsCount: 2
  #   upvoters: []
  #   votes: 0
  # )

  # Comments.insert
  #   postId: telescopeId
  #   userId: tom._id
  #   author: tom.profile.name
  #   submitted: new Date(now - 5 * 3600 * 1000)
  #   body: "Interesting project Sacha, can I get involved?"

  # Comments.insert
  #   postId: telescopeId
  #   userId: sacha._id
  #   author: sacha.profile.name
  #   submitted: new Date(now - 3 * 3600 * 1000)
  #   body: "You sure can Tom!"
  # let's generate a bunch of unrealistic test verses...
  # i = 0
  # while i < 10
  #   Verses.insert
  #     text: "Test message #" + i
  #     author: plato.profile.name
  #     userId: plato._id
  #     createdAt: new Date(now - i * 3600 * 1000 + 1)

  #   i++

  # Verses.insert
  #   text: "what do you think about Dobrowsky's theory of positive disintegration"
  #   userId: brian._id
  #   sender: brian._id
  #   receiver: plato._id
  #   author: brian.profile.name
  #   createdAt: new Date(now - 10 * 3600 * 1000)

  # Verses.insert
  #   text: "nonsense!"
  #   userId: plato._id
  #   sender: plato._id
  #   receiver: brian._id
  #   author: plato.profile.name
  #   createdAt: new Date(now - 10.5 * 3600 * 1000)

  # Verses.insert
  #   text: "really?  I think it's da shit"
  #   userId: brian._id
  #   sender: brian._id
  #   receiver: plato._id
  #   author: brian.profile.name
  #   createdAt: new Date(now - 11 * 3600 * 1000)

  # Verses.insert 
  #   text: "this is a pretty long one. let's see what a message looks like" + 
  #         "when it's really really long. like if I were telling someone about" +
  #          "the 1000 petal lotus or the Bubble Meditation. or maybe the 3-card Tarot" +
  #          "card spread that I did last. Or the stack of weird books on my table." + 
  #          "or maybe my newest creative project, like my effort to bring a speech-controlled" +
  #          "platform to Raspberry Pi"
  #   userId: brian._id
  #   author: brian.profile.name
  #   sender: brian._id
  #   receiver: plato._id
  #   createdAt: new Date(now - 12 * 3600 * 1000)

  starterAttrs =
    text: 'Is capitalism merely a form of indentured servitude?'
    connectionLevel: 1
    createdAt: new Date()
    updatedAt: new Date()

  starterId = Starters.insert(starterAttrs)
  starter = Starters.find({text: 'Is capitalism merely a form of indentured servitude?'})
  console.log "Starter: " + starter
  starterIsValid = Schema.Verse.namedContext().validate(starter)
  console.log "Starter fixture is invalid" unless starterIsValid

  #starter1._id = starter1Id

  Starters.insert
    text: 'What\'s the most awesome place you\'ve ever traveled to?'
    connectionLevel: 1
    createdAt: new Date()
    updatedAt: new Date()
    # typology:'explorers' 
    # topic:'travel'
  Starters.insert
    text: 'What causes you to feel Eudomonia (feeling happy and melancholy at the same time)?'
    connectionLevel: 1
    createdAt: new Date()
    updatedAt: new Date()
    # typology:'dreamers' 
    # topic:'emotions'
  Starters.insert
    text: 'Is capitalism merely a form indentured servitude? What might be a better system?'
    connectionLevel: 2
    createdAt: new Date()
    updatedAt: new Date()
    # typology:'analysts' 
    # topic:'socialTheory'
  Starters.insert
    text: 'Should prosecutors press charges against General Patreus?'
    connectionLevel: 2
    createdAt: new Date()
    updatedAt: new Date()
    # typology:'guardians' 
    # topic:'news'
  Starters.insert
    text: 'Describe in detail the best orgasm you\'ve ever had'
    connectionLevel: 2
    createdAt: new Date()
    updatedAt: new Date()
    # typology:'explorers' 
    # topic:'travel'
  Starters.insert
    text: 'Should I try LSD?'
    connectionLevel: 3
    createdAt: new Date()
    updatedAt: new Date()
    # typology:'dreamers'
    # topic:'reality'
  Starters.insert
    text: 'Pros and cons of humanistic athiesm vs. other belief systems?'
    connectionLevel: 3
    createdAt: new Date()
    updatedAt: new Date()
    # typology:'analysts'
    # topic:'socialTheory'
  console.log "Failed to add fixture starters. Update da fixtures." if Starters.find().count < 8

  # Build a verse for the story fixture
  exampleVerse = {}
  exampleVerse.author = platoId
  exampleVerse.reader = brianId
  exampleVerse.text = "Yes.  Plutocracy is the only system worth considering."
  exampleVerse.createdAt = new Date()

  verseIsValid = Schema.Verse.namedContext().validate(exampleVerse)
  console.log "Verse fixture is invalid" unless verseIsValid

  # Build a chapter for the story fixture
  # redFlag - the schema is refusing to add this chapter...
  exampleChapter = {}
  exampleChapter.createdAt = new Date()
  exampleChapter.updatedAt = new Date()
  exampleChapter.starter = starterAttrs
  exampleChapter.verses = [exampleVerse, exampleVerse]
  console.log JSON.stringify(exampleChapter, null, 4)

  # console.log "fixtureChapter.starter validity:" + Schema.Chapter.namedContext().validateOne(exampleChapter, "starter")
  # console.log "fixtureChapter.createdAt validity:" + Schema.Chapter.namedContext().validateOne(exampleChapter, "createdAt")
  # console.log "fixtureChapter.updatedAt validity:" + Schema.Chapter.namedContext().validateOne(exampleChapter, "updatedAt")
  # console.log "fixtureChapter.verses validity:" + Schema.Chapter.namedContext().validateOne(exampleChapter, "verses")
  chapterIsValid = Schema.Chapter.namedContext().validate(exampleChapter)
  console.log "Chapter fixture is invalid" unless chapterIsValid
  # console.log Match.test(exampleChapter, Schema.Chapter)
  # console.log check(exampleChapter, Schema.Chapter)
  # console.log "Chapter:" + exampleChapter
  # console.log "chapter.createdAt" + exampleChapter.createdAt
  # console.log "chapter.verses" + exampleChapter.verses
  # console.log "chapter.starter" + exampleChapter.starter.text
  # console.log "first verse:" + exampleChapter.verses[0].text
  # obj = new Object()

  storyAttrs = 
    userIds: [brianId, platoId]
    checkedBy: []
    rejectedBy: []
    newMatch: true
    usersAreKin: false
    createdAt: new Date()
    updatedAt: new Date()
    latestChapterAddedAt: new Date()
    latestStarterAddedAt: new Date()
    chapters: [exampleChapter]
  Stories.insert storyAttrs



