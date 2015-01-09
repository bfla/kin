# Check that the userId specified owns the documents
@ownsDocument = (userId, doc) ->
  return doc?.userId is userId