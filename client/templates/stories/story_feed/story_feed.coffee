Template.storyFeed.helpers
  stories: () ->
    return Stories.find()
  # stories: () ->
  #   stories = Meteor.subscribe('storiesForUser')
  #   console.log JSON.stringify(stories)
  #   return stories

Template.storyFeed.events
  'click .story-feed-item': (e) ->
    $target = e.target
