# Check that the userId specified owns the documents
@ownsDocument = (userId, doc) ->
  return doc?.userId is userId

@userIsAnOwnerOfDocument = (userId, doc) ->
  return _.intersection(doc?.userIds, [userId]).count > 0