# Fixture data 
if Messages.find().count() is 0
  now = new Date().getTime()
  
  # create two users
  brianId = Meteor.users.insert(profile:
    name: "Brian"
  )
  brian = Meteor.users.findOne(brianId)
  platoId = Meteor.users.insert(profile:
    name: "Plato"
  )
  plato = Meteor.users.findOne(platoId)
  
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

  Messages.insert
    text: "what do you think about Dobrowsky's theory of positive disintegration"
    userId: brian._id
    author: brian.profile.name
    submitted: new Date(now - 10 * 3600 * 1000)

  Messages.insert
    text: "nonsense!"
    userId: plato._id
    author: plato.profile.name
    submitted: new Date(now - 7 * 3600 * 1000)

  Messages.insert
    text: "really?  I think it's da shit"
    userId: brian._id
    author: brian.profile.name
    submitted: new Date(now - 12 * 3600 * 1000)

  i = 0

  while i < 10
    Messages.insert
      text: "Test message #" + i
      author: plato.profile.name
      userId: plato._id
      submitted: new Date(now - i * 3600 * 1000 + 1)

    i++