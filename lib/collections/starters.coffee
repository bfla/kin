@Starters = new Mongo.Collection('starters')
Starters.attachSchema(Schema.Starter) # Validate the Story against our schema

@getRandomStarterWithLevel = (connectionLevel) ->
  # redFlag - this doesn't actually work yet... It just returns all the starters.
  starters = Starters.find({connectionLevel: connectionLevel}).fetch()
  console.log 'starters: ' + JSON.stringify(starters, null, 4)
  shuffledStarters = _.shuffle(starters)
  starter = _.first(starters)
  console.log "random starter: " + starter
  return starter