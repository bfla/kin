Template.errors.helpers
  errors: () ->
    return Errors.find() #This is a client-only collection in /helpers/.

Template.error.rendered = () ->
  error = @data
  Meteor.setTimeout () ->
    Errors.remove error._id
  , 3000