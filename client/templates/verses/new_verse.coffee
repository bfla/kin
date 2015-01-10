Template.newVerse.created = ->
  Session.set "verseSubmitErrors", {}

Template.newVerse.helpers
  errorVerse: (field) ->
    return Session.get("verseSubmitErrors")[field]

  errorClass: (field) ->
    if !!Session.get("verseSubmitErrors")[field]
        return "has-error" 
    else 
        return ""

Template.newVerse.events "submit form": (e) ->
  e.preventDefault()
  verse = {text: $(e.target).find("[name=text]").val()}
  errors = validateVerse(verse)
  return Session.set("verseSubmitErrors", errors)  if errors.text
  Meteor.call "verseInsert", verse, (error, result) ->
    return throwError(error.reason)  if error # display the error to the user and abort