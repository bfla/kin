@Errors = new Mongo.Collection(null) # Local (client-only) collection

@throwError = (message) ->
  Errors.insert {message: message}