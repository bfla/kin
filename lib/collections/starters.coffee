@Starters = new Mongo.Collection('starters')
Starters.attachSchema(Schema.Starter) # Validate the Story against our schema

Meteor.methods.getRandomStarterAndReturnId = (connectionLevel) ->
  # Starters have 3 connectionLevels: 1 small talk, 2 personal talk, and 3 deep talk
  count = db.Starters.find().length
  randomNumber = Math.random(0, count)
  starter = db.Starters.find().limit(-1).skip(randomNumber).next()
  return starter