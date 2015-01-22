Template.newVerse.created = ->
  Session.set "verseSubmitErrors", {}

Template.newVerse.helpers
  storyId: ()->
    this.storyId

  errorVerse: (field) ->
    return Session.get("verseSubmitErrors")[field]

  errorClass: (field) ->
    if !!Session.get("verseSubmitErrors")[field]
        return "has-error" 
    else 
        return ""

Template.newVerse.events 
  "submit form": (e) ->
    e.preventDefault()
    params = {}
    params.storyId = this.storyId
    params.verseText = $(e.target).find("[name=text]").val()
    Meteor.call 'addVerseToStoryAndUpdateStory', params, (err, result) ->
      if (err)
        return throwError(err.reason)