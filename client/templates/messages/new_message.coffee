Template.postSubmit.created = ->
  Session.set "messageSubmitErrors", {}

Template.messageSubmit.helpers
  errorMessage: (field) ->
    return Session.get("messageSubmitErrors")[field]

  errorClass: (field) ->
    if !!Session.get("messageSubmitErrors")[field]
        return "has-error" 
    else 
        return ""

Template.messageSubmit.events "submit form": (e) ->
  e.preventDefault()
  message = {text: $(e.target).find("[name=text]").val()}
  errors = validateMessage(message)
  return Session.set("messageSubmitErrors", errors)  if errors.text
  Meteor.call "messageInsert", message, (error, result) ->
    return throwError(error.reason)  if error # display the error to the user and abort