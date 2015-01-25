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
    params.storyId = Session.get('storyId')
    params.verseText = $(e.target).find("[name=text]").val()
    # Track the click
    EventTracker.trackEvent("Submit verse", {story: {_id: params.storyId}})
    # Log the submission
    Meteor.log.info "User attempted to submit verse",
      user: {_id: Meteor.user()._id} 
      story: {_id: params.storyId}
      verseText: params.verseText
    # Save it to the database
    Meteor.call 'addVerseToStoryAndUpdateStory', params, (err, result) ->
      if (err)
        return throwError(err.reason)