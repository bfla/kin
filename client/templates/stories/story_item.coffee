Template.storyItem.rendered = () ->
  story = this.data
  Session.set('storyId', story._id)
  Session.set('numberOfChaptersDisplayed', 1)

Template.storyItem.helpers
  numberOfChapters: () ->
    Session.get('numberOfChaptersDisplayed')
  chaptersToDisplay: () ->
    numberToDisplay = Session.get('numberOfChaptersDisplayed')
    sortedChapters = this.chapters.reverse()
    
    # This hack displays only the first 2 chapters
    # i = 0
    # chaptersToDisplay = sortedChapters.map (chapter) ->
    #   if i < 1
    #     i = i + 1
    #     return chapter
    #   else
    #     return null
    # return chaptersToDisplay
  # shouldShowDisplayMoreButton: () ->
  #   if this.chapters.count > Session.get('numberOfChaptersDisplayed')
  #     return true
  #   else
  #     return false

# Template.storyItem.events
#   'click #show-more-verses': (e) ->
#     numToDisplay = Session.set('numberOfChaptersDisplayed')
#     numToDisplay = numToDisplay + 2
#     if numToDisplay > this.data.chapters.length
#       Session.set('numberOfChaptersDisplayed', this.data.chapters.length)
#     else
#       Session.set('numberOfChaptersDisplayedr', numToDisplay)

  # currentChapters: () ->
  #   sortedChapters = this.sortedChapters()
  #   currentChapters = _.first(sortedChapters.fetch(), [2])